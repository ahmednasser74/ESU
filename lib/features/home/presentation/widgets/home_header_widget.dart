import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/home/data/models/response/home/home_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final HomeDataResponseModel data;

  @override
  Widget build(BuildContext context) {
    final student = SharedPrefs.instance.getUser().student;
    return Stack(
      children: [
        Container(
          height: .28.sh,
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
                Get.locale.toString() == 'ar' ? student.nameAr : student.nameEn,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w100,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                data.program,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 4.h),
              Text(
                student.academicId,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 2.h),
              const Divider(color: Colors.black45),
              Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      child: Column(
                        children: [
                          Text(
                            LocalizationKeys.programAmount.tr,
                            textAlign: TextAlign.center,
                          ),
                          Text('\$${data.programCost}'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: .5.w,
                    height: 50.h,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Column(
                        children: [
                          Text(
                            LocalizationKeys.paidAmount.tr,
                            textAlign: TextAlign.center,
                          ),
                          Text('\$${data.paid}'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: .5.w,
                    height: 50.h,
                    color: Colors.black,
                    margin: EdgeInsets.symmetric(horizontal: 6.w),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Column(
                        children: [
                          Text(
                            LocalizationKeys.unPaidAmount.tr,
                            textAlign: TextAlign.center,
                          ),
                          Text('\$${data.unpaid}'),
                        ],
                      ),
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
