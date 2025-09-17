import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view/widgets/custom_drawer_list.dart';
import 'package:weather_app/view/widgets/custom_text.dart';
import 'package:weather_app/view/widgets/custom_weather_details.dart';
import '../../resources/city_model.dart';
import '../../weather_service.dart';
import '../widgets/custom_vertical_spacer.dart';
import 'package:intl/intl.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  String formatCityTime(int timezoneOffsetInSeconds) {
    // Current UTC time
    final utc = DateTime.now().toUtc();

    // Add the offset
    final cityTime = utc.add(Duration(seconds: timezoneOffsetInSeconds));

    // Example: "Monday 09:45 PM"
    return DateFormat('EEEE hh:mm a').format(cityTime);
  }

  @override
  void initState() {
    super.initState();
    Provider.of<WeatherService>(context, listen: false).getCityLocation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<WeatherService>(context);
    String date = formatCityTime(info.timezone);
    return Scaffold(
      drawer: Drawer(
        elevation: 20,

        child: Column(
          children: [
            DrawerHeader(
              child: Text(
                'Select city',
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CustomDrawerList(
                  city: CityModel.cities[index],
                  onPressed: () {
                    setState(() {
                      info.cityName = CityModel.cities[index];
                      info.getCityLocation();
                      Navigator.pop(context);
                    });

                  },
                ),
                separatorBuilder: (context, index) => Container(),
                itemCount: CityModel.cities.length,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF003168),
                  Color(0xFF003168),
                  Color(0xFF0087b1),
                  Color(0xFF005b93),
                  Color(0xFF0087b1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.white.withOpacity(0.2), // frosted glass effect
                  child: Column(
                    children: [
                      const Spacer(),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Builder(
                          builder: (BuildContext context) {
                            return TextButton(
                              child: Icon(
                                Icons.menu,
                                color: Color(0xFFfff6ff),
                                size: 30,
                              ),
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
                          },
                        ),
                      ),
                      const Spacer(),
                      CustomText(
                        text: '${info.cityName}, ${info.country}',
                        fontSize: 50,
                      ),
                      CustomText(text: date, fontSize: 20),
                      const Spacer(),
                      const Image(
                        image: AssetImage("assets/images/cloud.png"),
                        height: 300,
                      ),
                      CustomText(
                        text: "${info.temp.toString()}°C",
                        fontSize: 50,
                      ),
                      CustomText(text: info.description, fontSize: 20),
                      const Spacer(),
                      SizedBox(
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomWeatherDetails(
                              type: "Humidity",
                              measure: info.humidity.toString(),
                              icon: Icons.water_drop,
                            ),
                            CustomVerticalSpacer(),
                            CustomWeatherDetails(
                              type: "Wind",
                              measure: '${info.windSpeed.toString()} m/s',
                              icon: CupertinoIcons.wind,
                            ),
                            CustomVerticalSpacer(),
                            CustomWeatherDetails(
                              type: "Feels like",
                              measure: "${info.feelsLike.toString()} C",
                              icon: CupertinoIcons.thermometer,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
