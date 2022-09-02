import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/custom_rich_text.dart';
import 'package:esu/features/student_data/data/models/response/plans_of_study/course_item_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CourseItemWidget extends StatelessWidget {
  const CourseItemWidget({
    Key? key,
    required this.course,
  }) : super(key: key);
  final CourseItemResponseModel course;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              Get.locale.toString() == 'en' ? course.name : course.nameAr,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 12.w,
            ),
            child: Column(
              children: [
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRichText(
                      title: '${LocalizationKeys.hours.tr} : ',
                      value: '${course.hours}',
                    ),
                    CustomRichText(
                      title: '${LocalizationKeys.code.tr} : ',
                      value: course.code,
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Visibility(
                  visible: course.prerequisite.isNotEmpty,
                  child: Column(
                    children: [
                      Text(LocalizationKeys.prerequisites.tr, style: const TextStyle(color: Colors.black)),
                      SizedBox(height: 6.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Wrap(
                          direction: Axis.horizontal,
                          textDirection: TextDirection.ltr,
                          spacing: 8.w,
                          children: course.prerequisite
                              .map(
                                (prerequisite) => PrerequisiteItemWidget(
                                  title: Get.locale.toString() == 'en' ? prerequisite.name : prerequisite.nameAr,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PrerequisiteItemWidget extends StatelessWidget {
  const PrerequisiteItemWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      margin: EdgeInsets.symmetric(vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(.8),
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(title, textAlign: TextAlign.start, style: const TextStyle(color: Colors.black)),
    );
  }
}
