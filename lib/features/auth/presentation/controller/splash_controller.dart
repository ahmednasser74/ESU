import 'package:boilerplate/core/dio/dio_request_handling.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/auth/presentation/screen/login_screen.dart';
import 'package:boilerplate/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<DioRequestHandlingController>();
    });
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
}
