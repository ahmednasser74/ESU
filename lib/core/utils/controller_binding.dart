import 'package:boilerplate/core/dio/dio_request_handling.dart';
import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/academic_info_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/admission_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';

import 'di.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Auth Cycle
    Get.lazyPut(
      () => Injection.di<DioRequestHandlingController>(),
      fenix: true,
    );
    Get.lazyPut(() => Injection.di<TranslationController>(), fenix: true);
    Get.lazyPut(() => Injection.di<SplashController>(), fenix: true);
    Get.lazyPut(() => Injection.di<LoginController>(), fenix: true);
    Get.lazyPut(() => Injection.di<AdmissionController>(), fenix: true);
    Get.lazyPut(() => Injection.di<AcademicInfoController>(), fenix: true);
  }
}
