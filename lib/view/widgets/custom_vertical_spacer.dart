import 'package:flutter/material.dart';

class CustomVerticalSpacer extends StatelessWidget {
  const CustomVerticalSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: VerticalDivider(
        color: Color(0xFFfff6ff),
        thickness: 2,
        width: 10,
      ),
    );
  }
}
