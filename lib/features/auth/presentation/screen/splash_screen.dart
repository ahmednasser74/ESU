import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: Center(
          child: Hero(
            tag: 'splash_tag',
            child: Assets.images.appIcon.image(width: .7.sw, height: .5.sh),
          ),
        ),
      ),
    );
  }
}
