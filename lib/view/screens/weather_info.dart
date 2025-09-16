import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/view/widgets/custom_text.dart';
import 'package:weather_app/view/widgets/custom_weather_details.dart';
import '../widgets/custom_vertical_spacer.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {

  double lon = 0 ;
  double lat = 0 ;
  double temp = 0;
  double feelsLike = 0 ;
  double humidity = 0 ;
  double windSpeed = 0 ;

  Future getCityLocation()async{
    final uri = 'http://api.openweathermap.org/geo/1.0/direct?q=London&limit=1&appid={API ID}' ;
    final url = Uri.parse(uri) ;
    final response = await http.get(url) ;
    final json = jsonDecode(response.body) ;
    final city = json[0] ;
    lat = city['lat'] ;
    lon = city['lon'];

    print(lon);
    print(lat) ;

    getWeather() ;
  }

  Future getWeather()async {
    final uri = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=58f1fae51c492533c9d5584fb8b06964' ;
    final url = Uri.parse(uri) ;
    final response = await http.get(url) ;
    final json = jsonDecode(response.body) as Map;

    temp = (json['main']['temp'] as num).toDouble();
    feelsLike = (json['main']['feels_like'] as num).toDouble();
    humidity = (json['main']['humidity'] as num).toDouble();
    windSpeed = (json['wind']['speed'] as num).toDouble();

    print(temp) ;
    print(feelsLike) ;
    print(humidity) ;
    print(windSpeed) ;
  }


  @override
  void initState() {
    super.initState();
    print("Widget initialized!");
    getCityLocation() ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      const CustomText(text: "Alexandria", fontSize: 50),
                      const CustomText(text: "Sunday 12:00Am", fontSize: 20),
                      const Spacer(),
                      const Image(
                        image: AssetImage("assets/images/cloud.png"),
                        height: 300,
                      ),
                       CustomText(text: temp.toString(), fontSize: 50),
                      const CustomText(text: "Hello", fontSize: 20),
                      const Spacer(),
                      SizedBox(
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomWeatherDetails(
                              type: "Humidity",
                              measure: humidity.toString(),
                              icon: Icons.water_drop,
                            ),
                            CustomVerticalSpacer(),
                            CustomWeatherDetails(
                              type: "Wind",
                              measure: "${windSpeed.toString()} m/s",
                              icon: CupertinoIcons.wind,
                            ),
                            CustomVerticalSpacer(),
                            CustomWeatherDetails(
                              type: "Feels like",
                              measure: "${feelsLike.toString()}C",
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
