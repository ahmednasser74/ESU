import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/home/data/models/response/home/home_data/home_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/flavor/flavors.dart';

class HomeHeaderWidget extends StatelessWidget {
  HomeHeaderWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final HomeDataResponseModel data;
  final student = SharedPrefs.instance.getUser();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: .18.sh,
          width: double.infinity,
          margin: EdgeInsets.only(top: 45.h, left: 18.w, right: 18.w),
          padding: EdgeInsets.only(top: 45.h, left: 12.w, right: 12.w, bottom: 12.h),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.5),
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
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: Flavors.isMidocean ? Assets.images.midoceanAppIcon.image(height: 60.h, width: 60.w, fit: BoxFit.fill) : Assets.images.esuTitleLogo.image(height: 60.r),
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() => Container(
        width: .5.w,
        height: 50.h,
        color: Colors.black,
        margin: EdgeInsets.symmetric(horizontal: 6.w),
      );
}
