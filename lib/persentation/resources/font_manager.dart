import 'package:flutter/material.dart';

class FontConstants {
  FontConstants._();
  static const String fontFaimly = "Righteous";
}

class FontWeightManager {
  FontWeightManager._();
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w700;
}

class FontSize {
  FontSize._();
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
}

class AppFonts {
  AppFonts._();

  static const TextStyle heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subHeading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );
}
