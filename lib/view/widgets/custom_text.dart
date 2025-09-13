import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.fontSize});
  final String text ;
  final double fontSize ;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.yaldevi(color: Color(0xFFfff6ff), fontSize: fontSize ,shadows: [
        Shadow(
          offset: Offset(2, 2),   // horizontal & vertical position
          blurRadius: 4,          // softness of the shadow
          color: Colors.black12,     // shadow color
        ),
      ],),
    );
  }
}
