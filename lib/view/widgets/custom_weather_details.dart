import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomWeatherDetails extends StatelessWidget {
  const CustomWeatherDetails({super.key, required this.type, required this.measure, required this.icon});

  final String type ;
  final String measure ;
  final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon , size: 40,color: Color(0xFFEDF2F4)),
        CustomText(text: type, fontSize: 20),
        CustomText(text: measure, fontSize: 20),

      ],
    );
  }
}
