import 'package:esu/core/extentions/spaces_box.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/mixin/validator_properties.dart';
import 'package:esu/core/src/widgets/app_text_field_widget.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/core/src/widgets/app_error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/auth/presentation/controller/register_personal_info_controller.dart';
import 'package:esu/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:esu/features/auth/presentation/widgets/country_picker_field_widget.dart';
import 'package:esu/features/auth/presentation/widgets/date_picker_field_widget.dart';
import 'package:esu/core/src/widgets/app_title_required_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/src/assets.gen.dart';
import '../../../../core/src/colors.dart';
import '../../../../core/src/widgets/app_container.dart';

class RegisterPersonalInfoScreen extends GetView<RegisterPersonalInfoController> with ValidatorProperties {
  RegisterPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.personalInformation.tr)),
      body: Form(
        key: controller.formKey,
        child: controller.obx(
          (state) => SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                10.heightBox,
                AppContainer(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: Assets.icons.notificationIcon.image(
                          height: 24.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        LocalizationKeys.weRecommendToUseEmail.tr,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                AppTitleRequiredWidget(title: LocalizationKeys.email.tr),
                AppTextFieldWidget(
                  controller: controller.emailController,
                  validator: emailValidator,
                  inputType: TextInputType.emailAddress,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.yourFirstNameEnglish.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourFirstNameEnController,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.yourSecondNameEnglish.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourSecondNameEnController,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.yourLastNameEnglish.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourLastNameEnController,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.yourFirstNameArabic.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourFirstNameArController,
                  acceptArabicCharOnly: true,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.yourSecondNameArabic.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourSecondNameArController,
                  acceptArabicCharOnly: true,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.yourLastNameArabic.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourLastNameArController,
                  acceptArabicCharOnly: true,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.identificationNumber.tr,
                ),
                AppTextFieldWidget(
                  validator: nationalIdValidator,
                  inputType: TextInputType.number,
                  controller: controller.nationalPassportController,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.mobileNumber.tr,
                ),
                AppTextFieldWidget(
                  controller: controller.phoneNumberController,
                  validator: phoneValidator,
                  inputType: TextInputType.phone,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.dateOfBirth.tr,
                ),
                DatePickerFieldWidget(
                  dateCallBack: (dateCallBack) => controller.birthDateController = dateCallBack,
                  initDate: controller.birthDateController,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.gender.tr,
                ),
                TitleDropDownButton(
                  list: [LocalizationKeys.male.tr, LocalizationKeys.female.tr],
                  isDense: true,
                  onChangeValue: (gender) => controller.genderController.text = gender,
                  initValue: controller.genderController.text,
                ),
                AppTitleRequiredWidget(title: LocalizationKeys.country.tr),
                CountryPickerFieldWidget(
                  list: state!,
                  countryNameCallBack: (country) => controller.countryId = country.id,
                  initValue: controller.countryId,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.nationality.tr,
                ),
                CountryPickerFieldWidget(
                  list: state,
                  countryNameCallBack: (nationality) => controller.nationalityId = nationality.id,
                  initValue: controller.nationalityId,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.yourJob.tr,
                  isRequired: false,
                ),
                AppTextFieldWidget(
                  controller: controller.jobController,
                ),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.yourCompany.tr,
                  isRequired: false,
                ),
                AppTextFieldWidget(
                  controller: controller.companyController,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          AppTitleRequiredWidget(title: LocalizationKeys.currentAddress.tr),
                          AppTextFieldWidget(
                            validator: addressValidator,
                            controller: controller.addressController,
                          ),
                        ],
                      ),
                    ),
                    12.widthBox,
                    AppButton(
                      onPressed: controller.locationPermissionHandler,
                      backgroundColor: Colors.white,
                      borderColor: AppColors.primaryColor,
                      paddingVertical: 11.h,
                      child: const Icon(Icons.location_on_rounded),
                    )
                  ],
                ),
                30.heightBox,
                AppButton(
                  onPressed: controller.goToUploadFilesScreen,
                  title: LocalizationKeys.next.tr,
                  minimumSize: const Size(double.infinity, 30),
                ),
                SizedBox(height: 18.h),
              ],
            ),
          ),
          onLoading: const Center(child: LoadingIndicatorWidget()),
          onError: (error) => AppErrorWidget(errorMessage: error),
        ),
      ),
    );
  }
}
