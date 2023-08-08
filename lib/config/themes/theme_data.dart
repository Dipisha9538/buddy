import 'package:blood_buddy/config/constants/color_constants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.mainColor,
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: Color.fromARGB(255, 50, 49, 48),
      filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10), 
      labelStyle: TextStyle(fontFamily: 'Raleway Regular'), 
      hintStyle: TextStyle(fontFamily: 'Raleway Regular'),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    fontFamily: "Raleway Regular"
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.mainColor,
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.black,
      contentPadding: EdgeInsets.symmetric(vertical: 10), 
      labelStyle: TextStyle(fontFamily: 'Raleway Regular'), 
      hintStyle: TextStyle(fontFamily: 'Raleway Regular'),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    fontFamily: "Raleway Regular"
  );
}
