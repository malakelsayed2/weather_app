import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class WeatherService extends ChangeNotifier {
  double lon = 0;
  double lat = 0;
  double temp = 0;
  double feelsLike = 0;
  double humidity = 0;
  double windSpeed = 0;
  String description = '';
  String cityName = 'London';
  String country = '';
  int timezone = 0;

  Future getCityLocation() async {

    final uri =
        'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=1&appid={APIkey}';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    final city = json[0];
    lat = city['lat'];
    lon = city['lon'];
    country = city['country'];

    getWeather();
  }

  Future getWeather() async {
    final uri =
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid={APIkey}';
    final url = Uri.parse(uri);
    final response = await http.get(url);
    final json = jsonDecode(response.body) as Map;

    temp = (json['main']['temp'] as num).toDouble();
    feelsLike = (json['main']['feels_like'] as num).toDouble();
    humidity = (json['main']['humidity'] as num).toDouble();
    windSpeed = (json['wind']['speed'] as num).toDouble();
    description = json['weather'][0]['description'];
    timezone = json['timezone'];

    notifyListeners();
  }
}
