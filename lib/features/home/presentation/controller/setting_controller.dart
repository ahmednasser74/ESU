import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/core/src/theme/theme_controller.dart';
import 'package:esu/core/enum/theme_data_helper.dart';
import 'package:esu/core/enum/language.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  TranslationController? translateController;
  ThemeController? themeController;
  late bool _isDarkMode;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      translateController = Get.find<TranslationController>();
      themeController = Get.find<ThemeController>();
    });
    _isDarkMode = SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value;
  }

  bool get isDarkMode => _isDarkMode;

  void changeTheme() {
    themeController!.changeTheme();
    _isDarkMode = themeController!.isDarkMode;
    update();
  }

  void changeLanguage() {
    translateController = Get.find<TranslationController>();
    if (translateController!.language.value == Language.english.value) {
      translateController!.changeLanguage(Language.arabic);
    } else if (translateController!.language.value == Language.arabic.value) {
      translateController!.changeLanguage(Language.english);
    }
  }
}
