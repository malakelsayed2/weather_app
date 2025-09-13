import 'package:flutter/material.dart';
import 'package:weather_app/view/screens/weather_info.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WeatherInfo(),);
  }
}
