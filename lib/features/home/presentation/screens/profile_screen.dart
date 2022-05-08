import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/validator_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/app_text_field_widget.dart';
import 'package:boilerplate/core/src/widgets/conditional_builder.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/features/home/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends GetView<ProfileController>
    with ValidatorProperties {
  const ProfileScreen({Key? key}) : super(key: key);

  String getFirstChar(String name) => name.isNotEmpty
      ? name.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.profile.tr)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => controller.pickPhoto(source: ImageSource.gallery),
              child: Stack(
                children: [
                  Container(
                    height: 90.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: GetBuilder<ProfileController>(
                      builder: (controller) => ConditionalBuilder(
                        condition: controller.photoUrl != null &&
                            controller.imageFile == null,
                        builder: (context) => CircleAvatar(
                          backgroundImage: NetworkImage(controller.photoUrl!),
                        ),
                        fallback: (context) => ConditionalBuilder(
                          condition: controller.imageFile != null,
                          builder: (context) => CircleAvatar(
                            backgroundImage: FileImage(controller.imageFile!),
                          ),
                          fallback: (context) => Center(
                            child: Text(
                              getFirstChar(
                                controller.fullNameEnController.text,
                              ),
                              style: TextStyle(fontSize: 30.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 2.w,
                    bottom: 2.h,
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryColor),
                      ),
                      child: Assets.icons.addImage.image(
                        height: 18.h,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            AppTextFieldWidget(
              controller: controller.fullNameEnController,
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
              controller: controller.fullNameArController,
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
              controller: controller.nationalPassportController,
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
              controller: controller.mobileController,
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
              controller: controller.emailController,
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
              controller: controller.passwordController,
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
              controller: controller.confirmPasswordController,
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
