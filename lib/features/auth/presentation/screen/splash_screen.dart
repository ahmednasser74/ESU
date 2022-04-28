import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: Center(
          child: Image.asset('assets/images/app_icon.png'),
        ),
      ),
    );
  }
}
