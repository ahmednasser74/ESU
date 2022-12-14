import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/features/auth/data/model/request/forget_password/forget_password_request_model.dart';
import 'package:esu/features/auth/domin/usecases/forget_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ForgetPasswordController extends GetxController {
  ForgetPasswordController({
    required this.forgetPasswordUseCase,
  });

  final ForgetPasswordUseCase forgetPasswordUseCase;

  final forgetPasswordEmailTEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final RxBool loadingIndicator = false.obs;
  String? verificationCode;

  Future<void> forgerPassword() async {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      HelperMethod.showToast(msg: LocalizationKeys.enterValidEmailFormat);
    } else {
      loadingIndicator.value = true;
      final response = await forgetPasswordUseCase(
        params: ForgetPasswordRequestModel(email: forgetPasswordEmailTEC.text),
      );
      response.fold(
        (l) => HelperMethod.showToast(
          msg: l ?? LocalizationKeys.somethingWentWrong,
        ),
        (r) {
          if (r.status == true) {
            verificationCode = r.data!.code;
            Get.toNamed(Routes.resetPasswordScreen);
          }
          HelperMethod.showToast(
            msg: r.message,
            toastLength: Toast.LENGTH_LONG,
          );
        },
      );
      loadingIndicator.value = false;
    }
  }
}
