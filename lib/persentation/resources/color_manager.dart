import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._(); // This private constructor ensure that you can't instantiate the object of this class

  static const Color primaryColor = Color(0xFF813377);
  static const Color primaryColorDark = Color(0xFF002171);
  static const Color primaryColorLight = Color.fromRGBO(129, 50, 116, 1);
  static const Color secondaryColor = Color.fromRGBO(243, 237, 242, 1);
  // static const Color secondaryColorDark = Color(0xFF008e76);
  static const Color secondaryColorLight = Color.fromRGBO(243, 237, 242, 1);
  // static const Color secondaryColorAccent = Color(0xFF1DE9B6);
  //static const Color backgroundColor = Color(0xFFECEFF1);
  static const Color surfaceColor = Color.fromRGBO(236, 236, 236, 0.76);
  static const Color errorColor = Color(0xFFB00020);
  static const Color shadowColor = Color.fromRGBO(129, 50, 116, 0.12);
  static const Color disabledColor = Color.fromARGB(255, 139, 119, 119);
  static const Color primaryOpacity70 = Color(0xB30D47A1);
  static const Color blackColor = Color(0xFF000000);
  static const Color transparentColor = Color(0x00000000);
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color tileWhiteColor = Color.fromRGBO(220, 220, 220, 1);
  static const Color greyColor = Color.fromRGBO(164, 164, 164, 0.75);
  static const Color titleGreyColor = Color.fromRGBO(79, 79, 79, 1);
  static const Color circularAvtarColor = Color.fromRGBO(234, 221, 255, 1);
  //static const Color greyColorLight = Color(0xFFE0E0E0);
  // static const Color greyColorDark = Color(0xFF212121);
  static const Color paymentIn = Color(0xFF00BFA5);
  static const Color paymentOut = Color(0xFFEF5350);
}
