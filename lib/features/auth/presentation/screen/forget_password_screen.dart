import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/validator_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/app_text_field_widget.dart';
import 'package:boilerplate/features/auth/presentation/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController>
    with ValidatorProperties {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forget Password')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.appIcon.image(
              height: .24.sh,
            ),
            AppTextFieldWidget(
              controller: controller.forgetPasswordEmailTEC,
              validator: emailValidator,
              labelText: LocalizationKeys.email.tr,
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Assets.icons.email.image(
                  height: 8,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
