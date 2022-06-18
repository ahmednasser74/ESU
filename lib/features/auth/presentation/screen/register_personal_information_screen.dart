import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/mixin/validator_properties.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:esu/core/src/widgets/error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/auth/presentation/controller/personal_info_controller.dart';
import 'package:esu/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:esu/features/auth/presentation/widgets/date_picker_field_widget.dart';
import 'package:esu/features/auth/presentation/widgets/lookup_drop_down_button.dart';
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
                TextFormField(
                  controller: controller.emailController,
                  validator: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourFirstNameEnglish.tr,
                ),
                TextFormField(
                  validator: nameValidator,
                  controller: controller.yourFirstNameEnController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourSecondNameEnglish.tr,
                ),
                TextFormField(
                  validator: nameValidator,
                  controller: controller.yourSecondNameEnController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourLastNameEnglish.tr,
                ),
                TextFormField(
                  validator: nameValidator,
                  controller: controller.yourLastNameEnController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourFirstNameArabic.tr,
                ),
                TextFormField(
                  validator: nameValidator,
                  controller: controller.yourFirstNameArController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourSecondNameArabic.tr,
                ),
                TextFormField(
                  validator: nameValidator,
                  controller: controller.yourSecondNameArController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourLastNameArabic.tr,
                ),
                TextFormField(
                  validator: nameValidator,
                  controller: controller.yourLastNameArController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.nationalIdPassportNumber.tr,
                ),
                TextFormField(
                  validator: nationalIdValidator,
                  keyboardType: TextInputType.number,
                  controller: controller.nationalPassportController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.mobileNumber.tr,
                ),
                TextFormField(
                  controller: controller.phoneNumberController,
                  validator: phoneValidator,
                  keyboardType: TextInputType.phone,
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
                // CountryPickerFieldWidget(
                //   countryNameCallBack: (countryCode) {
                //     ///controller.countryId
                //     print('countryCode = $countryCode');
                //   },
                // ),
                LookupDropDownButton(
                  list: state!,
                  isDense: true,
                  onChangeValue: (countryId) =>
                      controller.countryId = countryId,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.nationality.tr,
                ),
                LookupDropDownButton(
                  list: state,
                  isDense: true,
                  onChangeValue: (nationalityId) =>
                      controller.nationalityId = nationalityId,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourJob.tr,
                  isRequired: false,
                ),
                TextFormField(
                  controller: controller.jobController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.yourCompany.tr,
                  isRequired: false,
                ),
                TextFormField(
                  controller: controller.companyController,
                ),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.currentAddress.tr,
                ),
                TextFormField(
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
