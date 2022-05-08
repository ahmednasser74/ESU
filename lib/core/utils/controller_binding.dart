import 'package:boilerplate/core/dio/dio_request_handling.dart';
import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/academic_info_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/personal_info_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/splash_controller.dart';
import 'package:boilerplate/features/auth/presentation/controller/submit_admission_controller.dart';
import 'package:boilerplate/features/home/presentation/controller/profile_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/finance_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/letters_controller.dart';
import 'package:boilerplate/features/student_data/presentation/controller/transcript_controller.dart';
import 'package:get/get.dart';

import 'di.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    //-----------------------------------------------------------------------
    ///core
    Get.lazyPut(
      () => Injection.di<DioRequestHandlingController>(),
      fenix: true,
    );
    Get.lazyPut(() => Injection.di<TranslationController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///auth
    Get.lazyPut(() => Injection.di<SplashController>(), fenix: true);
    Get.lazyPut(() => Injection.di<LoginController>(), fenix: true);
    Get.lazyPut(() => Injection.di<SubmitAdmissionController>(), fenix: true);
    Get.lazyPut(() => Injection.di<AcademicInfoController>(), fenix: true);
    Get.lazyPut(() => Injection.di<PersonalInfoController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///home
    Get.lazyPut(() => Injection.di<ProfileController>(), fenix: true);
    //-----------------------------------------------------------------------
    ///student data
    Get.lazyPut(() => Injection.di<LettersController>(), fenix: true);
    Get.lazyPut(() => Injection.di<TranscriptController>(), fenix: true);
    Get.lazyPut(() => Injection.di<FinanceController>(), fenix: true);
  }
}
