import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:boilerplate/features/auth/domin/usecases/admission_usecase.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../domin/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final TextEditingController userNameTEC = TextEditingController(text: ''),
      passwordTEC = TextEditingController(text: '');
  LoginController({
    required this.loginUseCase,
    required this.admissionUseCase,
  });
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final LoginUseCase loginUseCase;
  final AdmissionUseCase admissionUseCase;
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
    // final isOnline = await isOnlineUseCase(params: NoParams());
    // if (isOnline) {
    //   final isValid = loginFormKey.currentState?.validate() ?? false;
    //   if (isValid) {
    //     _loadingIndicator.value = true;
    //     try {
    //       final params = LoginParams(
    //         userName: userNameTEC.text,
    //         password: passwordTEC.text,
    //       );
    //       await loginUseCase(params: params);
    //       Get.offNamed('');
    //       _loadingIndicator.value = false;
    //     } catch (e) {
    //       _loadingIndicator.value = false;
    //     }
    //   }
    // } else {
    //   print('network disconnected');
    // }
  }

  // void hey() async {
  //   print('hey');
  //   final f = await dioHelper.post(
  //     Endpoints.login,
  //     data: {
  //       'id': '20222006170',
  //       'password': '12345678',
  //     },
  //   );
  //   print('data = ${f.data}');
  // }

  void logout() {
    Get.offAllNamed('');
  }

  void changeLanguage() {
    if (translateController!.appLocale == 'en') {
      translateController!.changeLanguage('ar');
    } else if (translateController!.appLocale == 'ar') {
      translateController!.changeLanguage('en');
    }
  }
}
