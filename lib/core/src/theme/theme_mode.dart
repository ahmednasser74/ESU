import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

enum ThemeDataHelper {
  @JsonValue('light')
  light,
  @JsonValue('dark')
  dark,
}

extension ThemeModeExtension on ThemeDataHelper {
  String get value {
    switch (this) {
      case ThemeDataHelper.light:
        return 'light';
      case ThemeDataHelper.dark:
        return 'dark';
    }
  }

  ThemeData get themeData {
    switch (this) {
      case ThemeDataHelper.light:
        return ThemeData.light();
      case ThemeDataHelper.dark:
        return ThemeData.dark();
    }
  }

  set value(String value) {
    switch (value) {
      case 'light':
        value = ThemeDataHelper.light.value;
        break;
      case 'dark':
        value = ThemeDataHelper.dark.value;
        break;
    }
  }
}
