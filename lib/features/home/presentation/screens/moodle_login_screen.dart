import 'dart:io';

import 'package:esu/core/extentions/spaces_box.dart';
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
        height: .42.sh,
        child: Obx(
          () => AppFloatLoading(
            inAsyncCall: controller.isLoading.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: AppButton(
                    onPressed: Get.back,
                    backgroundColor: Colors.transparent,
                    child: const Icon(CupertinoIcons.clear_thick_circled),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Text(
                    LocalizationKeys.toLoginTheLearningManagement.tr,
                    style: TextStyle(fontSize: 18.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(Icons.warning_rounded, color: CupertinoColors.activeOrange),
                    6.widthBox,
                    Text(LocalizationKeys.attention.tr, style: const TextStyle(color: CupertinoColors.activeOrange)),
                  ],
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Text(
                    LocalizationKeys.moodleLoginWarning.tr,
                    style: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
                    textAlign: TextAlign.center,
                  ),
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
