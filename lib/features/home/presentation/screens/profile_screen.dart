import 'package:esu/core/extentions/spaces_box.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/mixin/validator_properties.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/styles.dart';
import 'package:esu/core/src/widgets/app_text_field_widget.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/core/src/widgets/app_error_widget.dart';
import 'package:esu/features/home/presentation/controller/profile_controller.dart';
import 'package:esu/features/home/presentation/widgets/show_image_source_bottom_sheet_dialog.dart';
import 'package:esu/features/student_data/presentation/widgets/forget_files_of_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/src/widgets/app_check_box_with_text.dart';
import '../../../../core/src/widgets/app_title_required_widget.dart';
import '../widgets/share_info_message_dialog.dart';

class ProfileScreen extends StatelessWidget with ValidatorProperties {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => WillPopScope(
        onWillPop: controller.onBack,
        child: Scaffold(
          appBar: AppBar(title: Text(LocalizationKeys.profile.tr)),
          body: ConditionalBuilder(
            condition: controller.isLoadingUpdateProfile,
            builder: (context) => Center(
              child: Container(
                height: 100.h,
                width: 100.w,
                decoration: CustomStyle.containerShadowDecoration,
                padding: const EdgeInsets.all(14),
                child: Lottie.asset(Assets.lottie.loading),
              ),
            ),
            fallback: (context) => ConditionalBuilder(
              condition: controller.isError,
              builder: (context) => AppErrorWidget(
                errorMessage: controller.errorMessage,
              ),
              fallback: (context) => SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Form(
                  key: controller.formKey,
                  child: ModalProgressHUD(
                    inAsyncCall: controller.isLoadingUpdateProfile,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => showImageSourceDialog(context),
                          child: Stack(
                            children: [
                              Container(
                                height: 90.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.primaryColor),
                                ),
                                child: ConditionalBuilder(
                                  condition: controller.photoUrl != null && controller.photoFile == null,
                                  builder: (context) => CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      controller.photoUrl!,
                                    ),
                                    backgroundColor: Colors.white,
                                  ),
                                  fallback: (context) => ConditionalBuilder(
                                    condition: controller.photoFile != null,
                                    builder: (context) => CircleAvatar(
                                      backgroundImage: FileImage(controller.photoFile!),
                                    ),
                                    fallback: (context) => Center(
                                      child: Text(
                                        controller.getFirstChar(controller.fullNameEnTEC.text),
                                        style: TextStyle(fontSize: 30.sp),
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
                          controller: controller.fullNameEnTEC,
                          readOnly: true,
                          validator: nameValidator,
                          dispose: false,
                          labelText: LocalizationKeys.fullNameEnglish.tr,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Assets.icons.profileIcon.image(
                              height: 18.r,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        AppTextFieldWidget(
                          controller: controller.fullNameArTEC,
                          readOnly: true,
                          dispose: false,
                          validator: nameValidator,
                          labelText: LocalizationKeys.fullNameArabic.tr,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Assets.icons.profileIcon.image(
                              height: 18.r,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        AppTextFieldWidget(
                          controller: controller.mobileTEC,
                          readOnly: true,
                          dispose: false,
                          validator: phoneValidator,
                          labelText: LocalizationKeys.mobileNumber.tr,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Assets.icons.mobile.image(
                              height: 18.r,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        AppTextFieldWidget(
                          controller: controller.emailTEC,
                          readOnly: true,
                          dispose: false,
                          validator: emailValidator,
                          labelText: LocalizationKeys.email.tr,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Assets.icons.email.image(
                              height: 18.r,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        AppTextFieldWidget(
                          controller: controller.passwordTEC,
                          hint: LocalizationKeys.password.tr,
                          onChanged: (value) => controller.password = value,
                          dispose: false,
                          obscureText: true,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Assets.icons.lock.image(
                              height: 18.r,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        AppTextFieldWidget(
                          controller: controller.confirmPasswordTEC,
                          onChanged: (value) => controller.passwordConfirm = value,
                          dispose: false,
                          obscureText: true,
                          validator: (confirmPassword) => confirmPasswordValidator(controller.passwordTEC.text, confirmPassword),
                          hint: LocalizationKeys.passwordConfirmation.tr,
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(12.sp),
                            child: Assets.icons.lock.image(
                              height: 18.r,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        ForgetFilesOfProfileWidget(
                          controller: controller,
                          state: controller.checkEditProfileData,
                        ),
                        SizedBox(height: 8.h),
                        AppTitleRequiredWidget(
                          title: LocalizationKeys.facebook.tr,
                          isRequired: false,
                          icon: Assets.icons.facebook.path,
                        ),
                        AppTextFieldWidget(
                          controller: controller.facebookController,
                          dispose: false,
                        ),
                        AppTitleRequiredWidget(
                          title: LocalizationKeys.instagram.tr,
                          isRequired: false,
                          icon: Assets.icons.instagram.path,
                        ),
                        AppTextFieldWidget(
                          controller: controller.instagramController,
                          dispose: false,
                        ),
                        AppTitleRequiredWidget(
                          title: LocalizationKeys.twitter.tr,
                          isRequired: false,
                          icon: Assets.icons.twitter.path,
                        ),
                        AppTextFieldWidget(
                          controller: controller.twitterController,
                          dispose: false,
                        ),
                        AppTitleRequiredWidget(
                          title: LocalizationKeys.linkedin.tr,
                          isRequired: false,
                          icon: Assets.icons.linkedin.path,
                        ),
                        AppTextFieldWidget(
                          controller: controller.linkedinController,
                          dispose: false,
                        ),
                        AppTitleRequiredWidget(
                          title: LocalizationKeys.whatsApp.tr,
                          icon: Assets.icons.whatsapp.path,
                        ),
                        AppTextFieldWidget(
                          controller: controller.whatsappController,
                          validator: phoneValidator,
                          inputType: TextInputType.phone,
                          dispose: false,
                        ),
                        AppTitleRequiredWidget(
                          title: '${LocalizationKeys.whatsApp.tr} (${LocalizationKeys.optional.tr})',
                          isRequired: false,
                          icon: Assets.icons.whatsapp.path,
                        ),
                        AppTextFieldWidget(
                          controller: controller.whatsappController2,
                          inputType: TextInputType.phone,
                          dispose: false,
                        ),
                        AppTitleRequiredWidget(
                          title: '${LocalizationKeys.whatsApp.tr} (${LocalizationKeys.optional.tr})',
                          isRequired: false,
                          icon: Assets.icons.whatsapp.path,
                        ),
                        AppTextFieldWidget(
                          controller: controller.whatsappController3,
                          inputType: TextInputType.phone,
                          dispose: false,
                        ),
                        AppTitleRequiredWidget(
                          title: LocalizationKeys.whatsAppPin.tr,
                          icon: Assets.icons.whatsapp.path,
                        ),
                        AppTextFieldWidget(
                          controller: controller.whatsAppPinController,
                          inputType: TextInputType.phone,
                          validator: onlyAcceptSixNumbers,
                          dispose: false,
                        ),
                        30.heightBox,
                        Row(
                          children: [
                            Expanded(
                              child: AppCheckboxWithTextWidget(
                                value: controller.isAgreeToPublishPersonalInfo,
                                onChanged: (v) => controller.isAgreeToPublishPersonalInfo = v,
                                title: LocalizationKeys.iWantToPublishPersonalInfo.tr,
                              ),
                            ),
                            IconButton(
                              onPressed: () => Get.dialog(const ShareInfoDialog()),
                              icon: const Icon(Icons.info_outline_rounded, color: Colors.blueGrey),
                            )
                          ],
                        ),
                        SizedBox(height: 30.h),
                        AppButton(
                          title: LocalizationKeys.updateProfile.tr,
                          fonSize: 18.sp,
                          onPressed: controller.editProfile,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showImageSourceDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const ShowImageSourceBottomSheet(),
    );
  }
}
