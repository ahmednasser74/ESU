import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:flutter/material.dart'
    show FormState, GlobalKey, TextEditingController;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domin/usecases/is_online_usecase.dart';
import '../../domin/usecases/login_usecase.dart';
import '../../domin/usecases/logout_usecase.dart';

class LoginController extends GetxController {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final IsOnlineUseCase isOnlineUseCase;
  final RxBool _loadingIndicator = false.obs;
  TranslationController? translateController;

  LoginController({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.isOnlineUseCase,
  });

  get getLoadingIndicator => _loadingIndicator.value;

  Future<bool> get isOnline async => isOnlineUseCase(params: NoParams());

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      translateController = Get.find<TranslationController>();
    });
  }

  Future<void> login() async {
    final isOnline = await isOnlineUseCase(params: NoParams());
    if (isOnline) {
      final isValid = loginFormKey.currentState?.validate() ?? false;
      if (isValid) {
        _loadingIndicator.value = true;
        try {
          final params = LoginParams(
            userName: userNameTEC.text,
            password: passwordTEC.text,
          );
          await loginUseCase(params: params);
          Get.offNamed('');
          _loadingIndicator.value = false;
        } catch (e) {
          _loadingIndicator.value = false;
        }
      }
    } else {
      print('network disconnected');
    }
  }

  Future<void> logout() async {
    if (await isOnline) {
      final isLogout = await logoutUseCase(params: NoParams());
      if (isLogout) {
        Get.offAllNamed('');
      }
    } else {
      Get.toNamed('');
    }
  }

  void changeLanguage() {
    if (translateController!.appLocale == 'en') {
      translateController!.changeLanguage('ar');
    } else if (translateController!.appLocale == 'ar') {
      translateController!.changeLanguage('en');
    }
  }

  @override
  void onClose() {
    userNameTEC.dispose();
    passwordTEC.dispose();
    super.onClose();
  }
}
