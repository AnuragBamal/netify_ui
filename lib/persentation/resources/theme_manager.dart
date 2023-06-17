import 'package:flutter/material.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/styles_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      //main colrs of the app
      primaryColor: ColorManager.primaryColor,
      primaryColorDark: ColorManager.primaryColorDark,
      primaryColorLight: ColorManager.primaryColorLight,
      disabledColor: ColorManager.disabledColor,
      //rippleColor
      splashColor: ColorManager.primaryOpacity70,
      // card view theme
      cardTheme: CardTheme(
        color: ColorManager.surfaceColor,
        shadowColor: ColorManager.shadowColor,
        elevation: AppSize.s4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.r10),
        ),
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        color: ColorManager.primaryColor,
        elevation: AppSize.s4,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: ColorManager.surfaceColor,
        ),
        shadowColor: ColorManager.primaryOpacity70,
        titleTextStyle: getRegularStyle(
            color: ColorManager.surfaceColor, fontSize: AppSize.s16),
      ),

      // Buttom theme
      buttonTheme: ButtonThemeData(
        buttonColor: ColorManager.primaryColor,
        disabledColor: ColorManager.disabledColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.r10),
        ),
        splashColor: ColorManager.primaryOpacity70,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primaryColor,
          foregroundColor: ColorManager.surfaceColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.r10),
          ),
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
        ),
      ),

      // Text theme
      textTheme: TextTheme(
        displayLarge: getBoldStyle(
          color: ColorManager.blackColor,
          fontSize: AppSize.s32,
        ),
        headlineLarge: getMediumStyle(
            color: ColorManager.primaryColor, fontSize: AppSize.s24),
        titleLarge: getRegularStyle(
            color: ColorManager.primaryColor, fontSize: AppSize.s20),
        labelLarge: getLightStyle(
            color: ColorManager.primaryColor, fontSize: AppSize.s16),
        bodyLarge: getRegularStyle(
            color: ColorManager.primaryColor, fontSize: AppSize.s14),
      ),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        hintStyle: getRegularStyle(color: ColorManager.primaryColor),
        labelStyle: getMediumStyle(color: ColorManager.primaryColor),
        errorStyle: getRegularStyle(color: ColorManager.errorColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r10),
          borderSide: const BorderSide(
            color: ColorManager.disabledColor,
            width: AppSize.s1_5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r10),
          borderSide: const BorderSide(
            color: ColorManager.primaryColor,
            width: AppSize.s1_5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r10),
          borderSide: const BorderSide(
            color: ColorManager.errorColor,
            width: AppSize.s1_5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.r10),
          borderSide: const BorderSide(
            color: ColorManager.primaryColor,
            width: AppSize.s1_5,
          ),
        ),
      ),
      visualDensity: const VisualDensity(
        horizontal: 0.0,
        vertical: 0.0,
      ));
}
