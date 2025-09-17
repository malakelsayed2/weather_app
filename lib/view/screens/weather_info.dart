
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/resources/color_manager.dart';
import 'package:weather_app/resources/size_manager.dart';
import 'package:weather_app/resources/string_manager.dart';
import 'package:weather_app/view/widgets/custom_drawer_list.dart';
import 'package:weather_app/view/widgets/custom_text.dart';
import 'package:weather_app/view/widgets/custom_weather_details.dart';
import '../../resources/city_model.dart';
import '../../resources/get_city_date.dart';
import '../../resources/get_weather_icon.dart';
import '../../resources/weather_service.dart';
import '../widgets/custom_vertical_spacer.dart';


class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {

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

  GetWeatherIcon icon = GetWeatherIcon() ;
  GetCityDate getCityDate = GetCityDate() ;

  @override
  Widget build(BuildContext context) {
    final info = Provider.of<WeatherService>(context);
     String date = getCityDate.formatCityTime(info.timezone) ;
    return Scaffold(
      backgroundColor:Color(ColorManager.backgroundColor),
      drawer: Drawer(
        elevation: SizeManager.size20,
        backgroundColor: Color(ColorManager.mainColor),
        child: Column(
          children: [
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
                separatorBuilder: (context, index) => Container(height: SizeManager.size10),
                itemCount: CityModel.cities.length,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(SizeManager.size15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Builder(
                  builder: (BuildContext context) {
                    return TextButton(
                      child: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: SizeManager.size30,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ),
              const Spacer(),
              CustomText(text: date, fontSize: SizeManager.size30),
              CustomText(
                text: info.cityName,
                fontSize: SizeManager.size50,
              ),
              const Spacer(),
              SizedBox(
                height: SizeManager.size200,
                width: SizeManager.size200,
                child: Image.asset(
                  icon.getWeatherIcon(info.condition),
                  fit: BoxFit.contain, // keeps proportions
                ),
              ),
              const Spacer(),
              CustomText(text: "${info.temp.toString()}°C", fontSize: SizeManager.size50),
              CustomText(text: info.description, fontSize: SizeManager.size20),
              const Spacer(),
              SizedBox(
                height: SizeManager.size150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomWeatherDetails(
                      type: StringManager.humidity,
                      measure: info.humidity.toString(),
                      icon: Icons.water_drop,
                    ),
                    CustomVerticalSpacer(),
                    CustomWeatherDetails(
                      type: StringManager.wind,
                      measure: '${info.windSpeed.toString()} m/s',
                      icon: CupertinoIcons.wind,
                    ),
                    CustomVerticalSpacer(),
                    CustomWeatherDetails(
                      type: StringManager.feelsLike,
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
    );
  }
}
