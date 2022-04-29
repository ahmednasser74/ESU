import 'package:boilerplate/core/const/list_const.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/features/auth/presentation/register_personal_info_properties.dart';
import 'package:boilerplate/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/country_picker_field_widget.dart';
import 'package:boilerplate/features/auth/presentation/widgets/date_picker_field_widget.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPersonalInfoScreen extends StatelessWidget
    with RegisterPersonalInfoProperties {
  RegisterPersonalInfoScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Information')),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ListView(
            children: [
              const TitleRequiredFieldWidget(title: 'Email'),
              TextFormField(
                validator: emailValidator,
                keyboardType: TextInputType.emailAddress,
              ),
              const TitleRequiredFieldWidget(
                  title: 'Your first name (English)'),
              TextFormField(
                validator: nameValidator,
              ),
              const TitleRequiredFieldWidget(
                  title: 'Your second name (English)'),
              TextFormField(
                validator: nameValidator,
              ),
              const TitleRequiredFieldWidget(title: 'Your last name (English)'),
              TextFormField(
                validator: nameValidator,
              ),
              const TitleRequiredFieldWidget(title: 'Your first name (Arabic)'),
              TextFormField(
                validator: nameValidator,
              ),
              const TitleRequiredFieldWidget(
                  title: 'Your second name (Arabic)'),
              TextFormField(
                validator: nameValidator,
              ),
              const TitleRequiredFieldWidget(title: 'Your last name (Arabic)'),
              TextFormField(
                validator: nameValidator,
              ),
              const TitleRequiredFieldWidget(
                  title: 'National ID/Passport Number*'),
              TextFormField(
                validator: nationalIdValidator,
                keyboardType: TextInputType.number,
              ),
              const TitleRequiredFieldWidget(title: 'Mobile Number'),
              TextFormField(
                validator: phoneValidator,
                keyboardType: TextInputType.phone,
              ),
              const TitleRequiredFieldWidget(title: 'Date of Birth'),
              DatePickerFieldWidget(
                dateCallBack: (dateCallBack) {
                  print('dateCallBack = $dateCallBack');
                },
              ),
              const TitleRequiredFieldWidget(title: 'Gender'),
              AuthDropDownButton(
                list: const ['Male', 'Female'],
                isDense: true,
                onChangeValue: (value) => print(value),
              ),
              const TitleRequiredFieldWidget(title: 'Country'),
              CountryPickerFieldWidget(
                countryNameCallBack: (countryName) {
                  print('countryName = $countryName');
                },
              ),
              const TitleRequiredFieldWidget(title: 'Nationality'),
              AuthDropDownButton(
                list: ListConst.nationalityList,
                isDense: true,
                onChangeValue: (value) => print(value),
              ),
              const TitleRequiredFieldWidget(
                title: 'Your job',
                isRequired: false,
              ),
              TextFormField(),
              const TitleRequiredFieldWidget(
                title: 'Your Company',
                isRequired: false,
              ),
              TextFormField(),
              const TitleRequiredFieldWidget(title: 'Current Address'),
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
                  // Get.toNamed(Routes.registerFileUploadScreen);
                },
                title: 'Next',
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
