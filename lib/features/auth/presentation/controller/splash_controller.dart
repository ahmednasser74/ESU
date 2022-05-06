import 'package:boilerplate/core/dio/dio_request_handling.dart';
import 'package:boilerplate/features/auth/presentation/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Get.find<DioRequestHandlingController>();
    });
    Future.delayed(
      const Duration(seconds: 1),
      () => Get.off(() => const LoginScreen()),
    );
  }

  void splashNavigation() async {
    // final isUserLogin = await isUserLoginUseCase(params: NoParams());
    // if (isUserLogin)
    //   navigate to homeScreen
    // Get.offNamed('');
    // else
    //navigate to loginScreen
    Get.off(const LoginScreen());
  }
}
