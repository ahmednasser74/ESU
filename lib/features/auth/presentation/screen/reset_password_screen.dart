import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/mixin/validator_properties.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/app_text_field_widget.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/features/auth/presentation/controller/reset_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController>
    with ValidatorProperties {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.resetPassword.tr)),
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controller.loadingIndicator.value,
          // progressIndicator: const LoadingIndicatorWidget(),
          child: Form(
            key: controller.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              children: [
                SizedBox(height: .06.sh),
                Center(
                  child: Text(
                    LocalizationKeys.verificationCodeSentToEmail.tr,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: .03.sh),
                AppTextFieldWidget(
                  controller: controller.verificationCodeTEC,
                  labelText: LocalizationKeys.verificationCode.tr,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Assets.icons.lock.image(
                      height: 8.h,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: .03.sh),
                AppTextFieldWidget(
                  controller: controller.passwordTEC,
                  labelText: LocalizationKeys.password.tr,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Assets.icons.lock.image(
                      height: 8,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: .03.sh),
                AppTextFieldWidget(
                  controller: controller.passwordConfirmationTEC,
                  labelText: LocalizationKeys.changePassword.tr,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Assets.icons.lock.image(
                      height: 8,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LocalizationKeys.thisFieldIsRequired.tr;
                    } else if (value.length < 8) {
                      return LocalizationKeys.atLeast8Characters.tr;
                    } else if (value.trim() !=
                        controller.passwordTEC.text.trim()) {
                      return LocalizationKeys
                          .passwordConfirmationNotMatchedWithPassword.tr;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: .03.sh),
                AppButton(
                  onPressed: () async {
                    await controller.forgerPassword();
                    if (controller.changePasswordSuccess.value) {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => const SuccessResetPasswordDialog(),
                      );
                    }
                  },
                  title: LocalizationKeys.changePassword.tr,
                  minimumSize: Size(double.infinity, 30.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessResetPasswordDialog extends StatefulWidget {
  const SuccessResetPasswordDialog({Key? key}) : super(key: key);

  @override
  State<SuccessResetPasswordDialog> createState() =>
      _SuccessResetPasswordDialogState();
}

class _SuccessResetPasswordDialogState
    extends State<SuccessResetPasswordDialog> {
  bool repeatAnimation = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => setState(() => repeatAnimation = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(32),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 20),
                Text(
                  LocalizationKeys
                      .congratulationYouHaveSuccessfullyChangedYourPassword.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 80),
                AppButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.loginScreen);
                  },
                  title: LocalizationKeys.goToLogin.tr,
                  minimumSize: Size(120.w, 40),
                ),
              ],
            ),
            Visibility(
              visible: repeatAnimation,
              child: Lottie.asset(
                Assets.lottie.celelbration,
                height: 160,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
