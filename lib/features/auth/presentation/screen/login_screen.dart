import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/validator_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/widgets/app_text_field_widget.dart';
import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/src/colors.dart';
import '../../../../core/src/widgets/custom_button.dart';
import '../../../../core/src/widgets/loading_indicator_widget.dart';

class LoginScreen extends GetView<LoginController> with ValidatorProperties {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.getLoadingIndicator,
        progressIndicator: const LoadingIndicatorWidget(),
        child: Scaffold(
          body: Form(
            key: controller.loginFormKey,
            child: ListView(
              padding: EdgeInsets.only(top: .06.sh, left: 18, right: 18),
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: AppButton(
                    onPressed: controller.changeLanguage,
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.primaryColor,
                    child: Text(
                      controller.translateController?.appLocale == 'ar'
                          ? 'English'
                          : 'العربية',
                    ),
                  ),
                ),
                SizedBox(height: .02.sh),
                Center(
                  child: Hero(
                    tag: 'splash_tag',
                    child: Assets.images.appIcon.image(
                      height: .24.sh,
                    ),
                  ),
                ),
                SizedBox(height: .06.sh),
                Column(
                  children: [
                    AppTextFieldWidget(
                      controller: controller.studentIdTEC,
                      labelText: LocalizationKeys.studentId.tr,
                      inputType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocalizationKeys.thisFieldIsRequired.tr;
                        } else {
                          return null;
                        }
                      },
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(height: .02.sh),
                    AppTextFieldWidget(
                      controller: controller.passwordTEC,
                      labelText: LocalizationKeys.password.tr,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocalizationKeys.thisFieldIsRequired.tr;
                        } else if (value.length < 8) {
                          return LocalizationKeys.atLeast8Characters.tr;
                        } else {
                          return null;
                        }
                      },
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: .015.sh),
                InkWell(
                  onTap: () => Get.toNamed(Routes.forgetPasswordScreen),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      LocalizationKeys.forgetPassword.tr,
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: .02.sh),
                AppButton(
                  title: LocalizationKeys.login.tr,
                  onPressed: controller.login,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: .08.sh),
                AppButton(
                  onPressed: () => Get.toNamed(Routes.registerAcademicInfo),
                  backgroundColor: Colors.transparent,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: LocalizationKeys.doNotHaveAccount.tr,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'din',
                      ),
                      children: [
                        TextSpan(
                          text: LocalizationKeys.admission.tr,
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontFamily: 'din',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
