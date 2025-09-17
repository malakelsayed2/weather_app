import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/weather_app.dart';
import 'package:weather_app/resources/weather_service.dart';

Future<void> main() async {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherService(),
      child: WeatherApp(),
    ),
  );
}
