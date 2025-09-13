import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/view/widgets/custom_text.dart';
import 'package:weather_app/view/widgets/custom_weather_details.dart';
import '../widgets/custom_vertical_spacer.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({super.key});

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
                      const CustomText(text: "20 C", fontSize: 50),
                      const CustomText(text: "Hello", fontSize: 20),
                      const Spacer(),
                      SizedBox(
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CustomWeatherDetails(
                              type: "Sunrise",
                              measure: "7:00",
                              icon: CupertinoIcons.sunrise,
                            ),
                            CustomVerticalSpacer(),
                            CustomWeatherDetails(
                              type: "Wind",
                              measure: "4m/s",
                              icon: CupertinoIcons.wind,
                            ),
                            CustomVerticalSpacer(),
                            CustomWeatherDetails(
                              type: "Temperature",
                              measure: "20C",
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
