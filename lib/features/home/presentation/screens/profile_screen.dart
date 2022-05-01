import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/validator_properties.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/src/widgets/file_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class ProfileScreen extends StatelessWidget with ValidatorProperties {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.profile.tr)),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              validator: nameValidator,
              decoration: InputDecoration(
                labelText: LocalizationKeys.fullNameEnglish.tr,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Assets.icons.profileIcon.image(
                    height: 8,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              validator: nameValidator,
              decoration: InputDecoration(
                labelText: LocalizationKeys.fullNameArabic.tr,
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              validator: nationalIdValidator,
              decoration: InputDecoration(
                labelText: LocalizationKeys.nationalIdPassportNumber.tr,
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              validator: phoneValidator,
              decoration: InputDecoration(
                labelText: LocalizationKeys.mobileNumber.tr,
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              validator: emailValidator,
              decoration: InputDecoration(
                labelText: LocalizationKeys.email.tr,
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              decoration: InputDecoration(
                labelText: LocalizationKeys.password.tr,
              ),
            ),
            SizedBox(height: 16.h),
            TextFormField(
              validator: passwordValidator,
              decoration: InputDecoration(
                labelText: LocalizationKeys.passwordConfirmation.tr,
              ),
            ),
            SizedBox(height: 16.h),
            FilePickerWidget(
              hint: LocalizationKeys.selectPhoto.tr,
              fileCallBack: (file) {},
            ),
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
