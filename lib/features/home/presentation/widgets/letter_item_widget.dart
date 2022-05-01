import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LetterItemWidget extends StatelessWidget {
  const LetterItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: Colors.white,
        border: Border.all(color: AppColors.primaryColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Statement of the date of the mid-term exams',
            style: TextStyle(fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Assets.icons.pdf.image(height: 20.h),
                      SizedBox(width: 6.w),
                      Text(
                        LocalizationKeys.englishVersion.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AppButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Assets.icons.pdf.image(height: 20.h),
                      SizedBox(width: 6.w),
                      Text(
                        LocalizationKeys.arabicVersion.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
