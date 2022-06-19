import 'package:esu/core/dio/dio_request_handling.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/presentation/screen/login_screen.dart';
import 'package:esu/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashController extends GetxController {
  String appVersion = '';

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DioRequestHandlingController>();
      Get.find<TranslationController>();
    });
    getVersion();
    Future.delayed(const Duration(seconds: 1), splashNavigation);
  }

  void splashNavigation() async {
    final token = SharedPrefs.instance.getToken();
    if (token == null) {
      Get.off(() => const LoginScreen());
    } else {
      Get.off(() => HomeScreen());
    }
  }

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }
}
