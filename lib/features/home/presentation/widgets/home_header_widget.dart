import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190.h,
          width: double.infinity,
          margin: EdgeInsets.only(top: 45.h, left: 18.w, right: 18.w),
          padding: EdgeInsets.only(
            top: 45.h,
            left: 14.w,
            right: 14.w,
            bottom: 14.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.5),
                blurRadius: 10.r,
                offset: Offset(0, 10.r),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                'Ahmed Mohamed Nasser',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w100,
                ),
              ),
              SizedBox(height: 4.h),
              const Text(
                'Master Of Project Management',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 4.h),
              const Text(
                '923123987345',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 2.h),
              const Divider(color: Colors.black45),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          LocalizationKeys.programAmount.tr,
                          textAlign: TextAlign.center,
                        ),
                        Text('\$1.000'),
                      ],
                    ),
                  ),
                  Container(
                    width: .5.w,
                    height: 50.h,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          LocalizationKeys.paidAmount.tr,
                          textAlign: TextAlign.center,
                        ),
                        Text('\$500'),
                      ],
                    ),
                  ),
                  Container(
                    width: .5.w,
                    height: 50.h,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          LocalizationKeys.unPaidAmount.tr,
                          textAlign: TextAlign.center,
                        ),
                        const Text('\$300'),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            child: Assets.images.esuTitleLogo.image(height: 60.r),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
