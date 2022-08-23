import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/src/theme/theme.dart';
import 'package:esu/core/src/theme/theme_mode.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  @override
  void onInit() async {
    setDarkMode();
    Get.changeTheme(_isDarkMode ? CustomsThemes.darkThemeData : CustomsThemes.lightThemeData);
    super.onInit();
  }

  void changeTheme() {
    final isDarkMode = SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value;
    Get.changeTheme(isDarkMode ? CustomsThemes.lightThemeData : CustomsThemes.darkThemeData);
    SharedPrefs.instance.saveString(key: SharedPrefsKeys.themeMode, value: isDarkMode ? ThemeDataHelper.light.value : ThemeDataHelper.dark.value);
    setDarkMode();
    update();
  }

  void setDarkMode() {
    _isDarkMode = SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value;
  }
}
