import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/features/auth/presentation/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/flavor/flavors.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            const Spacer(),
            Center(
              child: Hero(
                tag: 'splash_tag',
                child: Image.asset(Flavors.appIcon, width: .7.sw, height: .5.sh),
              ),
            ),
            const Spacer(),
            Text(
              controller.appVersion.isEmpty ? '' : 'v${controller.appVersion}',
              style: const TextStyle(color: Colors.grey),
            ),
            SizedBox(height: .02.sh),
            SizedBox(
              height: 12.r,
              width: 12.r,
              child: const CircularProgressIndicator(strokeWidth: 2),
            ),
            SizedBox(height: .02.sh),
          ],
        ),
      ),
    );
  }
}
