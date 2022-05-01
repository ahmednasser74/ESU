import 'package:boilerplate/core/const/list_const.dart';
import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/validator_properties.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/country_picker_field_widget.dart';
import 'package:boilerplate/features/auth/presentation/widgets/date_picker_field_widget.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPersonalInfoScreen extends StatelessWidget
    with ValidatorProperties {
  RegisterPersonalInfoScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.personalInformation.tr)),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              TitleRequiredFieldWidget(title: LocalizationKeys.email.tr),
              TextFormField(
                validator: emailValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.yourFirstNameEnglish.tr,
              ),
              TextFormField(
                validator: nameValidator,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.yourSecondNameEnglish.tr,
              ),
              TextFormField(
                validator: nameValidator,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.yourLastNameEnglish.tr,
              ),
              TextFormField(
                validator: nameValidator,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.yourFirstNameArabic.tr,
              ),
              TextFormField(
                validator: nameValidator,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.yourSecondNameArabic.tr,
              ),
              TextFormField(
                validator: nameValidator,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.yourLastNameArabic.tr,
              ),
              TextFormField(
                validator: nameValidator,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.nationalIdPassportNumber.tr,
              ),
              TextFormField(
                validator: nationalIdValidator,
                keyboardType: TextInputType.number,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.mobileNumber.tr,
              ),
              TextFormField(
                validator: phoneValidator,
                keyboardType: TextInputType.phone,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.dateOfBirth.tr,
              ),
              DatePickerFieldWidget(
                dateCallBack: (dateCallBack) {
                  print('dateCallBack = $dateCallBack');
                },
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.gender.tr,
              ),
              AuthDropDownButton(
                list: [LocalizationKeys.male.tr, LocalizationKeys.female.tr],
                isDense: true,
                onChangeValue: (value) => print(value),
              ),
              TitleRequiredFieldWidget(title: LocalizationKeys.country.tr),
              CountryPickerFieldWidget(
                countryNameCallBack: (countryName) {
                  print('countryName = $countryName');
                },
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.nationality.tr,
              ),
              AuthDropDownButton(
                list: ListConst.nationalityList,
                isDense: true,
                onChangeValue: (value) => print(value),
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.yourJob.tr,
                isRequired: false,
              ),
              TextFormField(),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.yourCompany.tr,
                isRequired: false,
              ),
              TextFormField(),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.currentAddress.tr,
              ),
              TextFormField(
                validator: addressValidator,
              ),
              SizedBox(height: 30.h),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('validate');
                  } else {
                    print('Not validate');
                  }
                  Get.toNamed(Routes.registerFileUploadScreen);
                },
                title: LocalizationKeys.next.tr,
                minimumSize: const Size(double.infinity, 30),
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }
}
