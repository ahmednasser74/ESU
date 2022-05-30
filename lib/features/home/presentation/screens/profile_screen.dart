import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/validator_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/app_text_field_widget.dart';
import 'package:boilerplate/core/src/widgets/conditional_builder.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/file_picker_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
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
        child: Form(
          key: controller.formKey,
          child: controller.obx(
            (state) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () =>
                      controller.pickPhoto(source: ImageSource.gallery),
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
                              backgroundImage:
                                  NetworkImage(controller.photoUrl!),
                            ),
                            fallback: (context) => ConditionalBuilder(
                              condition: controller.imageFile != null,
                              builder: (context) => CircleAvatar(
                                backgroundImage:
                                    FileImage(controller.imageFile!),
                              ),
                              fallback: (context) => Center(
                                child: Text(
                                  getFirstChar(
                                    controller.fullNameEnTEC.text,
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
                  controller: controller.fullNameEnTEC,
                  readOnly: true,
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
                  controller: controller.fullNameArTEC,
                  readOnly: true,
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
                  controller: controller.mobileTEC,
                  readOnly: true,
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
                  controller: controller.emailTEC,
                  readOnly: true,
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
                  controller: controller.passwordTEC,
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
                  controller: controller.confirmPasswordTEC,
                  validator: (value) {
                    if (controller.passwordTEC.text.isEmpty) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return LocalizationKeys.thisFieldIsRequired.tr;
                    }
                    if (value.length < 8) {
                      return LocalizationKeys.atLeast8Characters.tr;
                    }
                    if (value.trim() != controller.passwordTEC.text.trim()) {
                      return LocalizationKeys
                          .passwordConfirmationNotMatchedWithPassword.tr;
                    } else {
                      return null;
                    }
                  },
                  labelText: LocalizationKeys.passwordConfirmation.tr,
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Assets.icons.lock.image(
                      height: 8,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.copyOfYourIdOrPassport.tr,
                ),
                FilePickerWidget(
                  fileCallBack: (file) => controller.editProfile(
                    nationalPassportFile: file,
                  ),
                  hint: ' (image or .pdf)',
                  allowToPdf: true,
                  allowToImages: true,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.copyOfTheAcademicCertificate.tr,
                ),
                FilePickerWidget(
                  fileCallBack: (file) => controller.editProfile(
                    latestAcademicQualificationFile: file,
                  ),
                  hint: ' (image or .pdf)',
                  allowToPdf: true,
                  allowToImages: true,
                ),
                Visibility(
                  child: Column(
                    children: [
                      TitleRequiredFieldWidget(
                        title: LocalizationKeys.copyOfTranscript.tr,
                      ),
                      FilePickerWidget(
                        fileCallBack: (file) => controller.editProfile(
                          transcriptFile: file,
                        ),
                        hint: ' .pdf, .doc or .docx',
                        allowToPdf: true,
                        allowToDoc: true,
                        allowToDocx: true,
                      ),
                    ],
                  ),
                ),
                MissingUploadedFileEditProfileWidget(),
                AppButton(
                  title: LocalizationKeys.updateProfile.tr,
                  fonSize: 12.sp,
                  onPressed: () {},
                ),
              ],
            ),
            onLoading: const LoadingIndicatorWidget(),
            onError: (error) => AppErrorWidget(errorMessage: error.toString()),
          ),
        ),
      ),
    );
  }
}

class MissingUploadedFileEditProfileWidget extends GetView<ProfileController> {
  const MissingUploadedFileEditProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        print('state.nationalPassportFile: ${state?.nationalPassportFile}');
        print(
            'state.latestAcademicQualificationFile: ${state?.latestAcademicQualificationFile}');
        print('state.transcriptFile: ${state?.transcriptFile}');
        print('state.cv: ${state?.cv}');

        return Visibility(
          visible: state?.contractFile ?? false,
          child: Container(
            color: Colors.red,
            height: 30,
            width: 30,
          ),
        );
      },
    );
  }
}
