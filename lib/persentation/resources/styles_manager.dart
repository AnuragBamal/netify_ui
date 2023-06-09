import 'package:flutter/material.dart';
import 'package:netify/persentation/resources/font_manager.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFaimly, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: fontFaimly,
  );
}

//Regular Style

TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFaimly, color, FontWeightManager.regular);
}

// light Text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFaimly, color, FontWeightManager.light);
}

// bold Text style

TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFaimly, color, FontWeightManager.bold);
}

// medium Text style

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFaimly, color, FontWeightManager.medium);
}

//Semi Bold style

TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFaimly, color, FontWeight.w600);
}
