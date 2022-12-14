import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/features/home/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ShowImageSourceBottomSheet extends StatelessWidget {
  const ShowImageSourceBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8.h),
          Container(
            height: 4.h,
            width: .25.sw,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            LocalizationKeys.selectPhotoSource.tr,
            style: TextStyle(fontSize: 18.sp,color: Colors.black),
          ),
          SizedBox(height: 12.h),
          InkWell(
            onTap: () {
              Get.back();
              controller.pickPhoto(source: ImageSource.gallery);
            },
            child: Row(
              children: [
                SizedBox(width: 18.w),
                Icon(Icons.image_rounded, size: 24.r),
                SizedBox(width: 8.w),
                Text(
                  LocalizationKeys.gallery.tr,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          InkWell(
            onTap: () {
              Get.back();
              controller.pickPhoto(source: ImageSource.camera);
            },
            child: Row(
              children: [
                SizedBox(width: 18.w),
                Icon(Icons.camera_alt_outlined, size: 24.r),
                SizedBox(width: 8.w),
                Text(
                  LocalizationKeys.camera.tr,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
        ],
      ),
    );
  }
}
