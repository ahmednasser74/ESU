import 'package:flutter/material.dart';

import 'colors.dart';

class CustomsThemes {
  CustomsThemes();

  static final defaultThemeData = ThemeData(
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: MaterialColor(
    //     AppColors.primaryColor.value,
    //     const {
    //       50: AppColors.primaryColor,
    //       100: AppColors.primaryColor,
    //       200: AppColors.primaryColor,
    //       300: AppColors.primaryColor,
    //       400: AppColors.primaryColor,
    //       500: AppColors.primaryColor,
    //       600: AppColors.primaryColor,
    //       700: AppColors.primaryColor,
    //       800: AppColors.primaryColor,
    //       900: AppColors.primaryColor,
    //     },
    //   ),
    // ).copyWith(
    //   primary: AppColors.primaryColor,
    //   secondary: AppColors.primaryColor,
    // ),
    fontFamily: 'din',
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    primaryColor: AppColors.primaryColor,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    unselectedWidgetColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade50,
      hintStyle: const TextStyle(
        fontFamily: 'din',
        color: Colors.grey,
        height: 1.4,
      ),
      contentPadding:
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xff51b9cb), width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      focusedBorder: const OutlineInputBorder(
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
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontFamily: 'din',
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16,
            color: Colors.green,
            fontFamily: 'din',
          ),
        ),
        // overlayColor: MaterialStateProperty.all(
        //   Colors.transparent,
        // ),
        // foregroundColor: MaterialStateProperty.all(
        //   Colors.green,
        // ),
        //
        // backgroundColor: MaterialStateProperty.all(
        //   Colors.red,
        // ),
      ),
    ),
  );
}
