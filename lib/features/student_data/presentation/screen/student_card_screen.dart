import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/widgets/conditional_builder.dart';
import 'package:boilerplate/core/src/widgets/custom_rich_text.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StudentCardScreen extends StatelessWidget {
  const StudentCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final student = SharedPrefs.instance.getUser();
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.studentCard.tr)),
      body: Stack(
        children: [
          Center(child: Assets.images.studentId.image()),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 60.w,
              end: 20.w,
              top: 20.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConditionalBuilder(
                  condition: student.photo != null,
                  builder: (_) => ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(student.photo!, height: 120.h),
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomRichText(
                      title: '${LocalizationKeys.studentName.tr} : \n',
                      value: Get.locale.toString() == 'ar'
                          ? student.nameAr
                          : student.nameEn,
                    ),
                    SizedBox(height: 8.h),
                    CustomRichText(
                      title: '${LocalizationKeys.studentId.tr} : ',
                      value: student.academicId.toString(),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
