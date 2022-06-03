import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/validator_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/styles.dart';
import 'package:boilerplate/core/src/widgets/app_text_field_widget.dart';
import 'package:boilerplate/core/src/widgets/conditional_builder.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/file_picker_widget.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:boilerplate/features/home/data/models/response/chec_profile_files/check_edit_profile_files_data_response_model.dart';
import 'package:boilerplate/features/home/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
      body: GetBuilder<ProfileController>(
        builder: (c) => ConditionalBuilder(
          condition: c.isLoadingUpdateProfile,
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
            condition: c.isError,
            builder: (context) => AppErrorWidget(errorMessage: c.errorMessage),
            fallback: (context) => SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Form(
                key: controller.formKey,
                child: ModalProgressHUD(
                  inAsyncCall: c.isLoadingUpdateProfile,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () => controller.pickPhoto(
                          source: ImageSource.gallery,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 90.h,
                              width: 90.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: AppColors.primaryColor),
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
                                  border:
                                      Border.all(color: AppColors.primaryColor),
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
                        onChanged: (value) => controller.editProfile(
                          password: value,
                        ),
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
                        onChanged: (value) => controller.editProfile(
                          password: value,
                        ),
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
                          if (value.trim() !=
                              controller.passwordTEC.text.trim()) {
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
                      SizedBox(height: 8.h),
                      ForgetFilesOfProfileWidget(
                        controller: controller,
                        state: c.checkEditProfileData,
                      ),
                      SizedBox(height: 18.h),
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
    );
  }
}

class ForgetFilesOfProfileWidget extends StatelessWidget {
  const ForgetFilesOfProfileWidget({
    Key? key,
    required this.state,
    required this.controller,
  }) : super(key: key);
  final CheckEditProfileFilesDataResponseModel? state;
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///passport
        Visibility(
          visible: state?.nationalPassportFile ?? false,
          child: Column(
            children: [
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
            ],
          ),
        ),

        ///transcript
        Visibility(
          visible: state?.transcriptFile ?? false,
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

        ///academic certificate
        Visibility(
          visible: state?.latestAcademicQualificationFile ?? false,
          child: Column(
            children: [
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
            ],
          ),
        ),

        ///contract
        Visibility(
          visible: state?.contractFile ?? false,
          child: Column(
            children: [
              TitleRequiredFieldWidget(
                title: LocalizationKeys
                    .copyOfTheStudentsContractWithTheUniversity.tr,
                titleSize: 18,
              ),
              FilePickerWidget(
                fileCallBack: (file) => controller.editProfile(
                  contractFile: file,
                ),
                hint: ' .pdf, .doc or .docx',
                allowToPdf: true,
                allowToDoc: true,
                allowToDocx: true,
              ),
            ],
          ),
        ),

        ///cv
        Visibility(
          visible: state?.cv ?? false,
          child: Column(
            children: [
              TitleRequiredFieldWidget(
                title: LocalizationKeys.uploadCv.tr,
                isRequired: false,
              ),
              FilePickerWidget(
                fileCallBack: (file) => controller.editProfile(
                  cvFile: file,
                ),
                fieldIsRequired: false,
                allowToPdf: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
