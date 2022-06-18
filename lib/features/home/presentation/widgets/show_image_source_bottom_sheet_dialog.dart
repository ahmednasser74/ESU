import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/features/home/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ShowImageSourceBottomSheetDialog extends StatelessWidget {
  const ShowImageSourceBottomSheetDialog({Key? key}) : super(key: key);

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
            style: TextStyle(fontSize: 18.sp),
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
                Icon(Icons.image, size: 20.r),
                SizedBox(width: 8.w),
                Text(
                  LocalizationKeys.gallery.tr,
                  style: TextStyle(fontSize: 14.sp),
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
                Icon(Icons.camera_alt_outlined, size: 20.r),
                SizedBox(width: 8.w),
                Text(
                  LocalizationKeys.camera.tr,
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ),
          SizedBox(height: 18.h),
        ],
      ),
    );
  }
}
