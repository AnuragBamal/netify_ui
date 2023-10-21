import 'package:flutter/material.dart';
import 'package:netify/persentation/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, String fontFaimly, Color color,
    FontWeight fontWeight, double? letterSpacing) {
  if (letterSpacing == null) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFaimly,
    );
  } else {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFaimly,
        letterSpacing: letterSpacing);
  }
}

//Regular Style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFaimly, color,
      FontWeightManager.regular, null);
}

// light Text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFaimly, color, FontWeightManager.light, null);
}

// bold Text style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFaimly, color, FontWeightManager.bold, null);
}

// medium Text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, FontConstants.fontFaimly, color,
      FontWeightManager.medium, 0.15);
}

//Semi Bold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFaimly, color, FontWeight.w600, 0.15);
}
