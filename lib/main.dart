import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/weather_app.dart';
import 'package:weather_app/weather_service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherService(),
      child: WeatherApp(),
    ),
  );
}
