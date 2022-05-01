import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/validator_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/app_text_field_widget.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/src/widgets/file_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class ProfileScreen extends StatelessWidget with ValidatorProperties {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.profile.tr)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppTextFieldWidget(
              validator: nameValidator,
              labelText: LocalizationKeys.fullNameEnglish.tr,
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Assets.icons.profileIcon.image(
                  height: 8,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            AppTextFieldWidget(
              validator: nameValidator,
              labelText: LocalizationKeys.fullNameArabic.tr,
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Assets.icons.profileIcon.image(
                  height: 8,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            AppTextFieldWidget(
              validator: nationalIdValidator,
              labelText: LocalizationKeys.nationalIdPassportNumber.tr,
              prefixIcon: Padding(
                padding: EdgeInsets.all(10.sp),
                child: Assets.icons.identity.image(
                  height: 8,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            AppTextFieldWidget(
              validator: phoneValidator,
              labelText: LocalizationKeys.mobileNumber.tr,
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Assets.icons.mobile.image(
                  height: 8,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            AppTextFieldWidget(
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
            SizedBox(height: 16.h),
            AppTextFieldWidget(
              validator: passwordValidator,
              labelText: LocalizationKeys.password.tr,
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Assets.icons.lock.image(
                  height: 8,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            AppTextFieldWidget(
              validator: passwordValidator,
              labelText: LocalizationKeys.passwordConfirmation.tr,
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Assets.icons.lock.image(
                  height: 8,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            FilePickerWidget(
              hint: LocalizationKeys.selectPhoto.tr,
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.all(12.w),
                child: Assets.icons.addImage.image(
                  height: 18,
                  fit: BoxFit.fill,
                  color: AppColors.primaryColor,
                ),
              ),
              fileCallBack: (file) {},
            ),
            SizedBox(height: 16.h),
            AppButton(
              title: LocalizationKeys.updateProfile.tr,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
