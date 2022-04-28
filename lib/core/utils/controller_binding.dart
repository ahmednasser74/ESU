import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';

import 'injection_container.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Auth Cycle
    Get.lazyPut(() => Injection.di<TranslationController>(), fenix: true);
    Get.lazyPut(() => Injection.di<SplashController>(), fenix: true);
    Get.lazyPut(() => Injection.di<LoginController>(), fenix: true);
  }
}
