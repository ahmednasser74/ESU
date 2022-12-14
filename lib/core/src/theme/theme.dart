import 'package:esu/core/flavor/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../colors.dart';

class AppThemes {
  AppThemes();

  // ThemeData get getTheme => SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value ? darkThemeData : lightThemeData;
  ThemeData get getTheme => Get.isDarkMode ? darkThemeData : lightThemeData;

  static final lightThemeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: MaterialColor(
        AppColors.primaryColor.value,
        {
          50: Flavors.primaryColor,
          100: Flavors.primaryColor,
          200: Flavors.primaryColor,
          300: Flavors.primaryColor,
          400: Flavors.primaryColor,
          500: Flavors.primaryColor,
          600: Flavors.primaryColor,
          700: Flavors.primaryColor,
          800: Flavors.primaryColor,
          900: Flavors.primaryColor,
        },
      ),
    ).copyWith(
      primary: Flavors.primaryColor,
      secondary: Flavors.primaryLightColor,
    ),
    fontFamily: 'din',
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),
    textTheme: TextTheme(
      headline5: TextStyle(fontSize: 14.sp, fontFamily: 'din', color: Colors.teal),
      headline6: TextStyle(fontSize: 12.sp, fontFamily: 'din', color: Colors.red),
      subtitle1: TextStyle(fontSize: 16.sp, fontFamily: 'din', color: Colors.black),
      subtitle2: TextStyle(fontSize: 14.sp, fontFamily: 'din', color: Colors.purple),
      headline1: TextStyle(fontSize: 24.sp, fontFamily: 'din', color: Colors.deepPurple),
      headline2: TextStyle(fontSize: 22.sp, fontFamily: 'din', color: Colors.deepOrange),
      headline3: TextStyle(fontSize: 20.sp, fontFamily: 'din', color: Colors.grey),
      headline4: TextStyle(fontSize: 18.sp, fontFamily: 'din', color: Colors.pink),

      /// list tile color
      // bodyText1: TextStyle(fontSize: 16, fontFamily: 'din', color: Colors.white),
      /// default style of text
      bodyText2: TextStyle(fontSize: 14.sp, fontFamily: 'din', color: Colors.black),
      headlineLarge: TextStyle(fontSize: 24.sp, fontFamily: 'din', color: Colors.orange),
      labelMedium: TextStyle(fontSize: 16.sp, fontFamily: 'din', color: Colors.green),
    ),
    primaryColor: Flavors.primaryColor,
    accentColor: Flavors.primaryLightColor,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Flavors.primaryColor),
    scaffoldBackgroundColor: Colors.white,
    unselectedWidgetColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade50,
      hintStyle: const TextStyle(fontFamily: 'din', color: Colors.grey, height: 1.4),
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Flavors.primaryColor, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Flavors.primaryColor, width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6.r)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.r),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontFamily: 'din',
        color: Colors.black,
      ),
      iconTheme:  IconThemeData(color: Flavors.primaryColor),
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

  static final darkThemeData = ThemeData(
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
      brightness: Brightness.dark,
    ),
    fontFamily: 'din',
    textTheme: const TextTheme(
      headline5: TextStyle(fontSize: 14, fontFamily: 'din', color: Colors.teal),
      headline6: TextStyle(fontSize: 12, fontFamily: 'din', color: Colors.red),
      subtitle1: TextStyle(fontSize: 16, fontFamily: 'din', color: Colors.black),
      subtitle2: TextStyle(fontSize: 14, fontFamily: 'din', color: Colors.purple),
      headline1: TextStyle(fontSize: 24, fontFamily: 'din', color: Colors.deepPurple),
      headline2: TextStyle(fontSize: 22, fontFamily: 'din', color: Colors.deepOrange),
      headline3: TextStyle(fontSize: 20, fontFamily: 'din', color: Colors.grey),
      headline4: TextStyle(fontSize: 18, fontFamily: 'din', color: Colors.pink),

      /// list tile color
      // bodyText1: TextStyle(fontSize: 16, fontFamily: 'din', color: Colors.white),
      /// default style of text
      bodyText2: TextStyle(fontSize: 14, fontFamily: 'din', color: Colors.black),
      headlineLarge: TextStyle(fontSize: 24, fontFamily: 'din', color: Colors.orange),
      labelMedium: TextStyle(fontSize: 16, fontFamily: 'din', color: Colors.green),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentTextStyle: const TextStyle(fontSize: 16, fontFamily: 'din', color: Colors.black54),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(AppColors.blackColor),
      fillColor: MaterialStateProperty.all(AppColors.primaryColor),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
      trackColor: MaterialStateProperty.all(AppColors.primaryColor),
    ),
    primaryColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    unselectedWidgetColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(fontFamily: 'din', color: Colors.grey, height: 1.4),
      labelStyle: const TextStyle(fontFamily: 'din', color: AppColors.primaryColor, height: 1.4),
      contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      shadowColor: Colors.transparent,
      color: Colors.grey[850]!,
      titleTextStyle: const TextStyle(fontSize: 18, fontFamily: 'din', color: Colors.white),
      iconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, color: Colors.green, fontFamily: 'din'),
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
