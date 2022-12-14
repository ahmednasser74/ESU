import 'package:esu/core/cache/cache.dart';
import 'package:esu/core/dependencies/dependency_init.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/mixin/validator_properties.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/app_text_field_widget.dart';
import 'package:esu/features/auth/presentation/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/const/shared_prefs_keys.dart';
import '../../../../core/flavor/flavors.dart';
import '../../../../core/src/colors.dart';
import '../../../../core/src/widgets/app_button.dart';
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
                    borderColor: Theme.of(context).primaryColor,
                    child: Text(
                      Get.locale.toString() == 'ar' ? 'English' : 'العربية',
                    ),
                  ),
                ),
                SizedBox(height: .02.sh),
                Center(
                  child: Hero(
                    tag: 'splash_tag',
                    child: Image.asset(Flavors.appIcon, height: .24.sh),
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
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Theme.of(context).primaryColor,
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
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).primaryColor,
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
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: .02.sh),
                AppButton(
                  title: LocalizationKeys.login.tr,
                  onPressed: controller.login,
                  fontWeight: FontWeight.bold,
                  fonSize: 18,
                ),
                SizedBox(height: .08.sh),
                AppButton(
                  onPressed: () => Get.toNamed(Routes.registerAcademicInfo),
                  backgroundColor: Colors.transparent,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: LocalizationKeys.doNotHaveAccount.tr,
                      style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontFamily: 'din',
                      ),
                      children: [
                        TextSpan(
                          text: LocalizationKeys.admission.tr,
                          style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'din'),
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
