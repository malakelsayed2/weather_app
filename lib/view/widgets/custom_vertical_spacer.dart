import 'package:flutter/material.dart';
import 'package:weather_app/resources/size_manager.dart';

class CustomVerticalSpacer extends StatelessWidget {
  const CustomVerticalSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.size50,
      child: VerticalDivider(
        color: Colors.black,
        thickness:  SizeManager.size2,
        width:  SizeManager.size10,
      ),
    );
  }
}
