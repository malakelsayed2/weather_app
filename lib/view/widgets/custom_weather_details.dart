import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/resources/color_manager.dart';
import 'package:weather_app/resources/size_manager.dart';

import 'custom_text.dart';

class CustomWeatherDetails extends StatelessWidget {
  const CustomWeatherDetails({
    super.key,
    required this.type,
    required this.measure,
    required this.icon,
  });

  final String type;

  final String measure;

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: SizeManager.size40,
          color: Color(ColorManager.mainColor),
        ),
        CustomText(text: type, fontSize: SizeManager.size20),
        CustomText(text: measure, fontSize: SizeManager.size20),
      ],
    );
  }
}
