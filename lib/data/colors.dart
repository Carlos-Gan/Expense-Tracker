import 'package:flutter/material.dart';

class AppColors{

  static const Color primaryColor = Color(0xff00B2E7);
  static const Color secondaryColor = Color(0xffE064F7);
  static const Color tertiaryColor = Color(0xffFF8D6C);

  static const Color selectedColor = Color.fromARGB(255, 231, 150, 0);
  static const Color unselectedColor = Color.fromARGB(255, 218, 172, 248);

  static const Color surface = Color.fromRGBO(238, 238, 238, 1);
  static const Color onSurface = Color.fromRGBO(0, 0, 0, 1);

  static const Color outline = Color.fromRGBO(158, 158, 158, 1);

  static const Color barChartColor1 = Color.fromRGBO(66, 165, 245, 1);
  static const Color barChartColor2 =  Color.fromRGBO(21, 101, 192, 1);

  static const Color grayIcons = Color.fromRGBO(158, 158, 158, 1);

  static const Color pickerColor = Color.fromRGBO(0, 141, 223, 1);

  static const LinearGradient btnGradient = LinearGradient(
    colors: [
      primaryColor,
      secondaryColor,
      tertiaryColor,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color sucessColor = Color(0xff4CAF50);
  static const Color errorColor = Color(0xffF44336);
  static const Color warningColor = Color(0xffFF9800);
  static const Color infoColor = Color(0xff2196F3);

  static const Color textPrimary = Color(0xff000000);
  static const Color textSecondary = Color(0xff757575);
  static const Color textDisabled = Color(0xff9E9E9E);

  static const Color textPrimaryDark = Color(0xffFFFFFF);
  static const Color textSecondaryDark = Color(0xffBDBDBD);
  static const Color textDisabledDark = Color(0xff757575);

  static const Color InputColorDecoration = Color.fromARGB(255, 255, 255, 255);
}