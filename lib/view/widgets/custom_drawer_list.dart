import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/weather_service.dart';

class CustomDrawerList extends StatelessWidget {
  const CustomDrawerList({super.key, required this.city, required this.onPressed});

  final String city ;
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {
    Provider.of<WeatherService>(context) ;
    return Container(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          city,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
