import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/src/theme.dart';
import 'package:esu/core/src/theme/theme_mode.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkMode = false;

  @override
  void onInit() async {
    String themeMode = SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) ?? ThemeDataHelper.light.value;
    isDarkMode = themeMode == ThemeDataHelper.dark.value;
    Get.changeTheme(isDarkMode ? CustomsThemes.darkThemeData : CustomsThemes.lightThemeData);
    super.onInit();
  }

  void changeTheme() {
    final isDarkMode = SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value;
    Get.changeTheme(isDarkMode ? CustomsThemes.lightThemeData : CustomsThemes.darkThemeData);
    SharedPrefs.instance.saveString(key: SharedPrefsKeys.themeMode, value: isDarkMode ? ThemeDataHelper.light.value : ThemeDataHelper.dark.value);
    print('themeMode ${SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode)}');
    update();
  }
}
