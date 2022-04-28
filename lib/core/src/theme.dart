import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class CustomsThemes {
  CustomsThemes();

  static const String fontFamily = 'Din';

  static final defaultThemeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(
        AppColors.primaryColor.value,
        const {
          50: AppColors.primaryColor,
          100: AppColors.primaryColor,
          200: AppColors.primaryColor,
          300: AppColors.primaryColor,
          400: AppColors.primaryColor,
          500: AppColors.primaryColor,
          600: AppColors.primaryColor,
          700: AppColors.primaryColor,
          800: AppColors.primaryColor,
          900: AppColors.primaryColor,
        },
      ),
    ).copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
    ),
    fontFamily: fontFamily,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    primaryColor: AppColors.primaryColor,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    unselectedWidgetColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade50,
      hintStyle: const TextStyle(
        fontFamily: fontFamily,
        color: Colors.grey,
        height: 1.4,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2.0),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      titleSpacing: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontFamily: fontFamily,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontSize: 16.sp,
            color: Colors.green,
            fontFamily: fontFamily,
          ),
        ),
        // overlayColor: MaterialStateProperty.all(
        //   Colors.transparent,
        // ),
        foregroundColor: MaterialStateProperty.all(
          AppColors.primaryColor,
        ),

        backgroundColor: MaterialStateProperty.all(
          AppColors.primaryColor,
        ),
      ),
    ),
  );
}
