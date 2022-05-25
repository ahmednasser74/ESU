import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_rich_text.dart';
import 'package:boilerplate/features/student_data/data/models/response/plans_of_study/course_item_response_model.dart';
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
              '#${course.code}',
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
                Center(
                  child: Text(
                    Get.locale.toString() == 'en' ? course.name : course.nameAr,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomRichText(
                      title: 'Hours : ',
                      titleValue: '4',
                    ),
                    CustomRichText(
                      title: 'Grade : ',
                      titleValue: 'A',
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomRichText(
                      title: 'Marks : ',
                      titleValue: '0',
                    ),
                    CustomRichText(
                      title: 'Points : ',
                      titleValue: '1',
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
