import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/mixin/validator_properties.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/app_text_field_widget.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/features/auth/presentation/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/flavor/flavors.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController> with ValidatorProperties {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.enterEmail.tr)),
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: controller.loadingIndicator.value,
          // progressIndicator: const LoadingIndicatorWidget(),
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  SizedBox(height: .06.sh),
                  Image.asset(Flavors.appIcon, height: .24.sh),
                  SizedBox(height: .03.sh),
                  AppTextFieldWidget(
                    controller: controller.forgetPasswordEmailTEC,
                    validator: emailValidator,
                    labelText: LocalizationKeys.email.tr,
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.sp),
                      child: Assets.icons.email.image(height: 8, color: Theme.of(context).primaryColor),
                    ),
                  ),
                  SizedBox(height: .03.sh),
                  AppButton(
                    onPressed: controller.forgerPassword,
                    title: LocalizationKeys.next.tr,
                    minimumSize: Size(double.infinity, 30.h),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
