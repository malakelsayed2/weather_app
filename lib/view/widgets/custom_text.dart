import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/resources/color_manager.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.fontSize});

  final String text;

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        color: Color(ColorManager.mainColor),
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            offset: Offset(2, 2), // horizontal & vertical position
            blurRadius: 4, // softness of the shadow
            color: Colors.white24, // shadow color
          ),
        ],
      ),
    );
  }
}
