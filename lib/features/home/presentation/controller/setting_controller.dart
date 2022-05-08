import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  TranslationController? translateController;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      translateController = Get.find<TranslationController>();
    });
  }

  void changeLanguage() {
    translateController = Get.find<TranslationController>();
    if (translateController!.appLocale == 'en') {
      translateController!.changeLanguage('ar');
    } else if (translateController!.appLocale == 'ar') {
      translateController!.changeLanguage('en');
    }
  }
}
