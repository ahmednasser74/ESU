import 'package:boilerplate/core/const/list_const.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/features/auth/presentation/register_personal_info_properties.dart';
import 'package:boilerplate/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPersonalInfoScreen extends StatelessWidget
    with RegisterPersonalInfoProperties {
  RegisterPersonalInfoScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Information')),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                TitleRequiredFieldWidget(title: 'Email'),
                TextFormField(
                  validator: emailValidator,
                  keyboardType: TextInputType.emailAddress,
                ),
                TitleRequiredFieldWidget(title: 'Your first name (English)'),
                TextFormField(
                  validator: nameValidator,
                ),
                TitleRequiredFieldWidget(title: 'Your second name (English)'),
                TextFormField(
                  validator: nameValidator,
                ),
                TitleRequiredFieldWidget(title: 'Your last name (English)'),
                TextFormField(
                  validator: nameValidator,
                ),
                TitleRequiredFieldWidget(title: 'Your first name (Arabic)'),
                TextFormField(
                  validator: nameValidator,
                ),
                TitleRequiredFieldWidget(title: 'Your second name (Arabic)'),
                TextFormField(
                  validator: nameValidator,
                ),
                TitleRequiredFieldWidget(title: 'Your last name (Arabic)'),
                TextFormField(
                  validator: nameValidator,
                ),
                TitleRequiredFieldWidget(title: 'National ID/Passport Number*'),
                TextFormField(
                  validator: nationalIdValidator,
                  keyboardType: TextInputType.number,
                ),
                TitleRequiredFieldWidget(title: 'Mobile Number'),
                TextFormField(
                  validator: phoneValidator,
                  keyboardType: TextInputType.phone,
                ),
                TitleRequiredFieldWidget(title: 'Date of Birth'),
                TitleRequiredFieldWidget(title: 'Gender'),
                AuthDropDownButton(
                  list: ['Male', 'Female'],
                  isDense: true,
                  onChangeValue: (value) => print(value),
                ),
                TitleRequiredFieldWidget(title: 'Country'),
                TextButton(
                    onPressed: () {
                      showCountryPicker(
                        context: context,
                        countryListTheme: CountryListThemeData(
                          flagSize: 25,
                          backgroundColor: Colors.white,
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.blueGrey),
                          bottomSheetHeight:
                              500, // Optional. Country list modal height
                          //Optional. Sets the border radius for the bottomsheet.
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                          //Optional. Styles the search field.
                          inputDecoration: InputDecoration(
                            labelText: 'Search',
                            hintText: 'Start typing to search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color(0xFF8C98A8).withOpacity(0.2),
                              ),
                            ),
                          ),
                        ),
                        onSelect: (Country country) =>
                            print('Select country: ${country.displayName}'),
                      );
                    },
                    child: Text('country')),
                TitleRequiredFieldWidget(title: 'Nationality'),
                AuthDropDownButton(
                  list: ListConst.nationalityList,
                  isDense: true,
                  onChangeValue: (value) => print(value),
                ),
                TitleRequiredFieldWidget(
                  title: 'Your job',
                  isRequired: false,
                ),
                TextFormField(),
                TitleRequiredFieldWidget(
                  title: 'Your Company',
                  isRequired: false,
                ),
                TextFormField(),
                TitleRequiredFieldWidget(title: 'Current Address'),
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
                  title: 'Next',
                  minimumSize: Size(double.infinity, 30),
                ),
                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
