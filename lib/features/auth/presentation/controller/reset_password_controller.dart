import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/auth/data/model/request/forget_password/reset_password_request_model.dart';
import 'package:boilerplate/features/auth/domin/usecases/reset_password_usecase.dart';
import 'package:boilerplate/features/auth/presentation/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordController({
    required this.resetPasswordUseCase,
  });

  final passwordTEC = TextEditingController();
  final passwordConfirmationTEC = TextEditingController();
  final verificationCodeTEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool loadingIndicator = false.obs;
  final RxBool changePasswordSuccess = false.obs;

  Future<void> forgerPassword() async {
    final forgetPwController = Get.find<ForgetPasswordController>();
    final isValid = formKey.currentState?.validate() ?? false;
    if (verificationCodeTEC.text != forgetPwController.verificationCode) {
      HelperMethod.showToast(msg: 'Verification Code is incorrect');
      return;
    }
    if (!isValid) {
      HelperMethod.showToast(msg: LocalizationKeys.enterValidEmailFormat);
      return;
    }
    loadingIndicator.value = true;
    final response = await resetPasswordUseCase(
      params: ResetPasswordRequestModel(
        email: forgetPwController.forgetPasswordEmailTEC.text,
        code: forgetPwController.verificationCode!,
        password: passwordTEC.text,
        passwordConfirmation: passwordConfirmationTEC.text,
      ),
    );
    response.fold(
      (l) => HelperMethod.showToast(
        msg: l ?? LocalizationKeys.somethingWentWrong,
      ),
      (r) {
        if (r.status == true) {
          changePasswordSuccess.value = true;
        }
        HelperMethod.showToast(msg: r.message);
      },
    );
    loadingIndicator.value = false;
  }
}
