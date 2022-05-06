import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/auth/data/model/request/login/login_request_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../domin/usecases/login_usecase.dart';

class LoginController extends GetxController {
  LoginController({required this.loginUseCase});

  final LoginUseCase loginUseCase;

  final TextEditingController studentIdTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  final loginFormKey = GlobalKey<FormState>();

  TranslationController? translateController;
  final RxBool _loadingIndicator = false.obs;

  get getLoadingIndicator => _loadingIndicator.value;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      translateController = Get.find<TranslationController>();
    });
  }

  Future<void> login() async {
    final isValid = loginFormKey.currentState?.validate() ?? false;
    if (!isValid) {
      HelperMethod.showToast(msg: 'Complete the form');
      return;
    }
    if (isValid) {
      _loadingIndicator.value = true;
      final params = LoginRequestModel(
        studentId: studentIdTEC.text,
        password: passwordTEC.text,
      );
      final response = await loginUseCase(params: params);
      response.fold(
        (l) => HelperMethod.showToast(msg: l ?? 'Something went wrong'),
        (r) {
          if (r.status == true) {
            SharedPrefs.instance.saveToken(token: r.data!.token);
            SharedPrefs.instance.saveUser(loginModel: r.data!);
            Get.offNamed(Routes.homeScreen);
          } else {
            HelperMethod.showToast(msg: r.message!);
          }
        },
      );
    }
  }

  void changeLanguage() {
    if (translateController!.appLocale == 'en') {
      translateController!.changeLanguage('ar');
    } else if (translateController!.appLocale == 'ar') {
      translateController!.changeLanguage('en');
    }
  }
}
