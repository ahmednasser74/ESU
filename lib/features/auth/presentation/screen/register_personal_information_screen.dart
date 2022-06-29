import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/mixin/validator_properties.dart';
import 'package:esu/core/src/widgets/app_text_field_widget.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:esu/core/src/widgets/error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/auth/presentation/controller/personal_info_controller.dart';
import 'package:esu/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:esu/features/auth/presentation/widgets/country_picker_field_widget.dart';
import 'package:esu/features/auth/presentation/widgets/date_picker_field_widget.dart';
import 'package:esu/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterPersonalInfoScreen extends GetView<PersonalInfoController>
    with ValidatorProperties {
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
                TitleRequiredFieldWidget(title: LocalizationKeys.email.tr),
                AppTextFieldWidget(
                  controller: controller.emailController,
                  validator: emailValidator,
                  inputType: TextInputType.emailAddress,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourFirstNameEnglish.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourFirstNameEnController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourSecondNameEnglish.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourSecondNameEnController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourLastNameEnglish.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourLastNameEnController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourFirstNameArabic.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourFirstNameArController,
                  acceptArabicCharOnly: true,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourSecondNameArabic.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourSecondNameArController,
                  acceptArabicCharOnly: true,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourLastNameArabic.tr,
                ),
                AppTextFieldWidget(
                  validator: nameValidator,
                  controller: controller.yourLastNameArController,
                  acceptArabicCharOnly: true,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.identificationNumber.tr,
                ),
                AppTextFieldWidget(
                  validator: nationalIdValidator,
                  inputType: TextInputType.number,
                  controller: controller.nationalPassportController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.mobileNumber.tr,
                ),
                AppTextFieldWidget(
                  controller: controller.phoneNumberController,
                  validator: phoneValidator,
                  inputType: TextInputType.phone,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.dateOfBirth.tr,
                ),
                DatePickerFieldWidget(
                  dateCallBack: (dateCallBack) =>
                      controller.birthDateController = dateCallBack,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.gender.tr,
                ),
                TitleDropDownButton(
                  list: [LocalizationKeys.male.tr, LocalizationKeys.female.tr],
                  isDense: true,
                  onChangeValue: (gender) =>
                      controller.genderController.text = gender,
                ),
                TitleRequiredFieldWidget(title: LocalizationKeys.country.tr),
                CountryPickerFieldWidget(
                  list: state!,
                  countryNameCallBack: (country) =>
                      controller.countryId = country.id,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.nationality.tr,
                ),
                CountryPickerFieldWidget(
                  list: state,
                  countryNameCallBack: (nationality) =>
                      controller.nationalityId = nationality.id,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourJob.tr,
                  isRequired: false,
                ),
                AppTextFieldWidget(
                  controller: controller.jobController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourCompany.tr,
                  isRequired: false,
                ),
                AppTextFieldWidget(
                  controller: controller.companyController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.currentAddress.tr,
                ),
                AppTextFieldWidget(
                  validator: addressValidator,
                  controller: controller.addressController,
                ),
                SizedBox(height: 30.h),
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
