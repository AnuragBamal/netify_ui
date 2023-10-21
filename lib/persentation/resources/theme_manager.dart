import 'package:flutter/material.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/font_manager.dart';
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
    fontFamily: FontConstants.fontFaimly,
    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.surfaceColor,
      shadowColor: ColorManager.shadowColor,
      elevation: AppSize.s4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.r8),
        side: const BorderSide(
          color: ColorManager.surfaceColor,
          width: AppSize.s1,
        ),
      ),
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      color: ColorManager.primaryColor,
      elevation: AppSize.s0,
      centerTitle: true,
      iconTheme: const IconThemeData(
        color: ColorManager.whiteColor,
      ),
      shadowColor: ColorManager.primaryOpacity70,
      titleTextStyle:
          getBoldStyle(color: ColorManager.whiteColor, fontSize: AppSize.s20),
    ),

    // Buttom theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primaryColor,
      disabledColor: ColorManager.disabledColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.r8),
      ),
      splashColor: ColorManager.primaryOpacity70,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorManager.primaryColor,
        foregroundColor: ColorManager.surfaceColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
        ),
        elevation: AppSize.s4,
        shadowColor: ColorManager.primaryOpacity70,
      ),
    ),

    // Text theme
    textTheme: TextTheme(
      displayLarge: getBoldStyle(
        color: ColorManager.blackColor,
        fontSize: AppSize.s24,
      ),
      headlineLarge:
          getBoldStyle(color: ColorManager.primaryColor, fontSize: AppSize.s24),
      titleLarge:
          getBoldStyle(color: ColorManager.blackColor, fontSize: AppSize.s16),
      titleMedium: getBoldStyle(
          // Expansion Title
          color: ColorManager.blackColor,
          fontSize: AppSize.s14),
      titleSmall:
          getBoldStyle(color: ColorManager.primaryColor, fontSize: AppSize.s12),
      labelLarge:
          getBoldStyle(color: ColorManager.primaryColor, fontSize: AppSize.s14),
      labelMedium: //avtar text
          getBoldStyle(color: ColorManager.blackColor, fontSize: AppSize.s12),
      labelSmall: // Used in expanded panel title
          getSemiBoldStyle(
              color: ColorManager.primaryColorLight, fontSize: AppSize.s12),
      bodyLarge:
          getBoldStyle(color: ColorManager.primaryColor, fontSize: AppSize.s14),
      bodyMedium: getBoldStyle(
          // Expansion Subtitle(No Color),Expansion Trailing,
          color: ColorManager.blackColor,
          fontSize: AppSize.s10),
      bodySmall: getBoldStyle(
          color: ColorManager.titleGreyColor, fontSize: AppSize.s10),
    ),
    listTileTheme: ListTileThemeData(
      // contentPadding: const EdgeInsets.symmetric(
      //   horizontal: AppSize.s16,
      //   vertical: AppSize.s8,
      // ),
      dense: false,
      iconColor: ColorManager.primaryColor,
      titleTextStyle: getBoldStyle(
          // Expansion Title
          color: ColorManager.primaryColor,
          fontSize: AppSize.s14),
      subtitleTextStyle: getBoldStyle(
          // Expansion Subtitle
          color: ColorManager.blackColor,
          fontSize: AppSize.s12),

      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(AppSize.r8),
      //   side: const BorderSide(
      //     color: ColorManager.surfaceColor,
      //     width: AppSize.s1,
      //   ),
      // ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle: getSemiBoldStyle(
          color: ColorManager.primaryColor.withOpacity(.80),
          fontSize: AppSize.s12),
      labelStyle:
          getBoldStyle(color: ColorManager.primaryColor, fontSize: AppSize.s16),
      errorStyle:
          getBoldStyle(color: ColorManager.errorColor, fontSize: AppSize.s14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSize.r10),
        // borderSide: const BorderSide(
        //   color: ColorManager.primaryColor,
        //   width: AppSize.s1_5,
        // ),
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
    dividerColor: ColorManager.primaryColor,
    dividerTheme: const DividerThemeData(
      color: ColorManager.primaryColor,
      thickness: AppSize.s1,
      space: AppSize.s1,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: ColorManager.secondaryColorLight,
      elevation: AppSize.s4,
      shape: CircularNotchedRectangle(),
    ),
    visualDensity: const VisualDensity(
      horizontal: 0.0,
      vertical: 0.0,
    ),
  );
}
