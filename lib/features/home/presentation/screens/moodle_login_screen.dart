import 'dart:io';

import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/core/src/widgets/app_float_loading.dart';
import 'package:esu/features/home/presentation/controller/moodle_login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/mixin/file_properties.dart';

// ignore: must_be_immutable
class MoodleLoginScreen extends GetView<MoodleLoginController> with FileProperties {
  MoodleLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: .3.sh,
        child: Obx(
          () => AppFloatLoading(
            inAsyncCall: controller.isLoading.value,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: AppButton(
                    onPressed: Get.back,
                    backgroundColor: Colors.transparent,
                    child: const Icon(CupertinoIcons.clear_thick_circled),
                  ),
                ),
                Text(
                  LocalizationKeys.youShouldToCaptureClearImageOfYourFace.tr,
                  style: TextStyle(fontSize: 20.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.h),
                Text(
                  LocalizationKeys.pleaseCaptureClearImageOfYourFaceToLogin.tr,
                  style: TextStyle(fontSize: 12.sp, color: AppColors.greyColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                AppButton(onPressed: pickImage, title: LocalizationKeys.capture.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final String? pickedPhotoPath = await pickedImage(source: ImageSource.camera);
    if (pickedPhotoPath != null) {
      controller.photo = File(pickedPhotoPath);
      controller.moodleLogin();
    }
  }
}
