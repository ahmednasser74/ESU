import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/enum/language.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationController extends GetxController {
  late Language _language;

  Language get language => _language;

  @override
  void onInit() async {
    final appLocal = SharedPrefs.instance.getString(key: SharedPrefsKeys.language) ?? Language.arabic.value;
    _language = appLocal == Language.arabic.value ? Language.arabic : Language.english;
    Get.updateLocale(Locale(_language.value));
    super.onInit();
  }

  void changeLanguage(Language language) async {
    if (_language.value == language.value) return;
    if (Language.arabic.value == language.value) {
      _language = Language.arabic;
      Get.updateLocale(Locale(Language.arabic.value));
      SharedPrefs.instance.saveString(key: SharedPrefsKeys.language, value: Language.arabic.value);
    } else {
      _language = Language.english;
      Get.updateLocale(Locale(Language.english.value));
      SharedPrefs.instance.saveString(key: SharedPrefsKeys.language, value: Language.english.value);
    }
  }
}
