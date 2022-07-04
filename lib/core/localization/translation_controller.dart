import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  var appLocale = 'ar';

  @override
  void onInit() async {
    appLocale = SharedPrefs.instance.getString(key: SharedPrefsKeys.language) ?? 'ar';
    Get.updateLocale(Locale(appLocale));
    super.onInit();
  }

  void changeLanguage(String type) async {
    if (appLocale == type) return;
    if (type == 'ar') {
      appLocale = 'ar';
      Get.updateLocale(Locale(appLocale));
      SharedPrefs.instance.saveString(key: SharedPrefsKeys.language, value: 'ar');
    } else {
      appLocale = 'en';
      Get.updateLocale(Locale(appLocale));
      SharedPrefs.instance.saveString(key: SharedPrefsKeys.language, value: 'en');
    }
  }
}
