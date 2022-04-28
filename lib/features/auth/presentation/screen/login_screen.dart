import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/src/colors.dart';
import '../../../../core/src/widgets/custom_button.dart';
import '../../../../core/src/widgets/loading_indicator_widget.dart';
import '../../../../core/utils/validator.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.getLoadingIndicator,
        progressIndicator: LoadingIndicatorWidget(),
        child: Scaffold(
          body: Form(
            key: controller.loginFormKey,
            child: ListView(
              padding: EdgeInsets.only(top: .06.sh, left: 10, right: 10),
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: AppButton(
                    onPressed: controller.changeLanguage,
                    backgroundColor: Colors.transparent,
                    borderColor: AppColors.primaryColor,
                    child: Text(
                      controller.translateController.appLocale == 'ar'
                          ? 'English'
                          : 'العربية',
                    ),
                  ),
                ),
                SizedBox(height: .02.sh),
                Center(
                  child: Assets.images.appIcon.image(
                    height: .24.sh,
                  ),
                ),
                SizedBox(height: .06.sh),
                Column(
                  children: [
                    TextFieldWidget(
                      controller: controller.userNameTEC,
                      labelText: LocalizationKeys.userName.tr,
                      inputType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: AppColors.primaryColor,
                      ),
                      validator: CustomValidator.userNameValidation,
                    ),
                    SizedBox(height: .02.sh),
                    TextFieldWidget(
                      controller: controller.passwordTEC,
                      labelText: LocalizationKeys.password.tr,
                      inputType: TextInputType.visiblePassword,
                      obscureText: true,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.primaryColor,
                      ),
                      validator: CustomValidator.passwordValidator,
                    ),
                  ],
                ),
                SizedBox(height: .04.sh),
                AppButton(
                  title: LocalizationKeys.login.tr,
                  marginHorizontal: .08.sh,
                  onPressed: controller.login,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: .08.sh),
                AppButton(
                  onPressed: () {},
                  backgroundColor: Colors.transparent,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: LocalizationKeys.doNotHaveAccount.tr,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'din',
                      ),
                      children: [
                        TextSpan(
                          text: LocalizationKeys.signUp.tr,
                          style: TextStyle(
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
