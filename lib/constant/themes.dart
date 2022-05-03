import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/constant/color.dart';
import 'package:news_app/constant/size_config.dart';

class ThemesServices {
  static final light = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: primaryColorLight),
    primaryColor: primaryColorLight,
    backgroundColor: backgroundColorLight,
    brightness: Brightness.light,
  );

  // static final dark = ThemeData(
  //   appBarTheme: const AppBarTheme(backgroundColor: darkAppbarClr),
  //   primaryColor: darkAppbarClr,
  //   backgroundColor: darkBodyClr,
  //   brightness: Brightness.dark,
  // );

  static TextStyle get headerTextStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black87,
          fontSize: SizeConfig.getPercentWidth(percent: .04),
          fontWeight: FontWeight.w700
        ),
      );

  static TextStyle get subLongTextStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.grey,
          fontSize: SizeConfig.getPercentWidth(percent: .04),
        ),
      );

  static TextStyle get smallButtonTextStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : light.primaryColor,
          fontSize: SizeConfig.getPercentWidth(percent: .05),
          fontWeight: FontWeight.w700
        ),
      );

  static TextStyle get detailTextStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: SizeConfig.getPercentWidth(percent: .05),
          fontWeight: FontWeight.w700
        ),
      );

  static TextStyle get subDetailTextStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.grey[800],
          fontSize: SizeConfig.getPercentWidth(percent: .05),
          fontWeight: FontWeight.w500
        ),
      );


}
