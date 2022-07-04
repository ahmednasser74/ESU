import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/utils/helper_methods.dart';
import 'package:esu/core/utils/notification_helper.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/data/model/request/fcm_token/register_fcm_token_request_model.dart';
import 'package:esu/features/auth/data/model/request/login/login_request_model.dart';
import 'package:esu/features/auth/domin/usecases/register_fcm_token_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../domin/usecases/login_usecase.dart';

class LoginController extends GetxController {
  LoginController({
    required this.loginUseCase,
    required this.registerFcmTokenUseCase,
  });

  final LoginUseCase loginUseCase;
  final RegisterFcmTokenUseCase registerFcmTokenUseCase;

  final TextEditingController studentIdTEC = TextEditingController(text: ''), passwordTEC = TextEditingController(text: '');
  final loginFormKey = GlobalKey<FormState>();

  TranslationController? translateController;
  final RxBool _loadingIndicator = false.obs;
  final prefs = SharedPrefs.instance;

  get getLoadingIndicator => _loadingIndicator.value;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      translateController = Get.find<TranslationController>();
    });
  }

  Future<void> login() async {
    final isValid = loginFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      HelperMethod.showToast(msg: 'Complete the form');
    } else {
      _loadingIndicator.value = true;
      final params = LoginRequestModel(
        studentId: studentIdTEC.text,
        password: passwordTEC.text,
      );
      final response = await loginUseCase(params: params);
      response.fold(
        (l) => HelperMethod.showToast(msg: l ?? 'Something went wrong'),
        (r) async {
          if (r.status == true) {
            await registerFcmToken();
            prefs.saveString(key: SharedPrefsKeys.token, value: r.data!.token);
            prefs.saveUser(studentModel: r.data!.student);
            Get.offNamed(Routes.homeScreen);
          } else {
            HelperMethod.showToast(msg: r.message!);
          }
        },
      );
      _loadingIndicator.value = false;
    }
  }

  Future<void> registerFcmToken() async {
    final fcmToken = await NotificationHelper.instance.getFcmToken;
    final requestModel = FcmTokenRequestModel(fcmToken: fcmToken);
    await registerFcmTokenUseCase(params: requestModel);
    prefs.saveString(key: SharedPrefsKeys.fcmToken, value: fcmToken);
  }

  void changeLanguage() {
    if (translateController!.appLocale == 'en') {
      translateController!.changeLanguage('ar');
    } else if (translateController!.appLocale == 'ar') {
      translateController!.changeLanguage('en');
    }
  }
}
