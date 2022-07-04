import 'package:esu/core/dio/dio_request_handling.dart';
import 'package:esu/core/helper/app_info_helper.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/domin/usecases/minimum_version_usecase.dart';
import 'package:esu/features/auth/presentation/widgets/update_app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController({required this.minimumVersionUseCase});

  final MinimumVersionUseCase minimumVersionUseCase;

  String appVersion = '';
  late bool appNeedUpdate;

  @override
  void onInit() async {
    super.onInit();
    init();
  }

  void init() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DioRequestHandlingController>();
      Get.find<TranslationController>();
    });
    await AppInfoHelper.init();
    appVersion = AppInfoHelper.getAppVersion;
    await getMinimumVersion();
    splashNavigation();
  }

  void splashNavigation() {
    if (!appNeedUpdate) {
      final token = SharedPrefs.instance.getToken();
      if (token == null) {
        Get.offNamed(Routes.loginScreen);
      } else {
        Get.offNamed(Routes.homeScreen);
      }
    } else {
      Get.dialog(const UpdateAppDialog(), barrierDismissible: false);
    }
  }

  Future<void> getMinimumVersion() async {
    final response = await minimumVersionUseCase(params: NoParams());
    response.fold(
      (l) {},
      (r) {
        final minVersion = r.minVersion;
        appNeedUpdate = AppInfoHelper.needUpdate(
          appVersion: appVersion,
          minVersion: minVersion,
        );
      },
    );
  }
}
