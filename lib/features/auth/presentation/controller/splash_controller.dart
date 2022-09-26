import 'package:esu/core/dio/dio_request_handling.dart';
import 'package:esu/core/helper/app_info_helper.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/theme/theme_controller.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/core/notification_helper/notification_helper.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:esu/features/auth/domin/usecases/minimum_version_usecase.dart';
import 'package:esu/features/auth/domin/usecases/register_fcm_token_usecase.dart';
import 'package:esu/features/auth/presentation/widgets/update_app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/const/shared_prefs_keys.dart';

class SplashController extends GetxController {
  SplashController({
    required this.registerFcmTokenUseCase,
    required this.minimumVersionUseCase,
  });

  final MinimumVersionUseCase minimumVersionUseCase;
  final RegisterFcmTokenUseCase registerFcmTokenUseCase;
  String appVersion = '';
  late bool appNeedUpdate;
  late bool isFailed;
  late bool isLoading;
  final prefs = SharedPrefs.instance;

  @override
  void onInit() async {
    super.onInit();
    init();
  }

  void init() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<DioRequestHandlingController>();
      Get.find<TranslationController>();
      Get.find<ThemeController>();
    });
    await AppInfoHelper.init();
    appVersion = AppInfoHelper.getAppVersion;
    await getMinimumVersion();
    await updateFcmToken();
    splashNavigation();
  }

  void splashNavigation() {
    if (!appNeedUpdate) {
      if (prefs.getString(key: SharedPrefsKeys.token) == null) {
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

  Future<void> updateFcmToken() async {
    final String? token = prefs.getString(key: SharedPrefsKeys.token);
    if (token != null) {
      final fcmToken = await NotificationHelper.instance.getFcmToken;
      final String? savedFcmToken = prefs.getString(key: SharedPrefsKeys.fcmToken);
      if (savedFcmToken == null || fcmToken != savedFcmToken) {
        final requestModel = FcmTokenRequestModel(
          fcmToken: fcmToken,
          type: savedFcmToken == null ? null : 'update',
        );
        await registerFcmTokenUseCase(params: requestModel);
        prefs.saveString(key: SharedPrefsKeys.fcmToken, value: fcmToken);
      }
    }
  }
}
