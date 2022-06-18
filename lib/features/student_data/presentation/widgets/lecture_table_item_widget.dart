import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/custom_rich_text.dart';
import 'package:esu/features/student_data/data/models/response/lecture_table/lecture_table_course_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';

class LectureTableItemWidget extends StatelessWidget {
  const LectureTableItemWidget({
    Key? key,
    required this.course,
  }) : super(key: key);
  final LectureTableCourseResponseModel course;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1.5,
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                course.courseName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              CustomRichText(
                title: '${LocalizationKeys.courseCode.tr}: ',
                value: course.courseCode,
                fontSize: 12.sp,
              ),
              const Spacer(),
              CustomRichText(
                title: '${LocalizationKeys.doctorName.tr}: ',
                value: course.doctorName,
                fontSize: 12.sp,
              ),
            ],
          ),
          SizedBox(height: 6.h),
          CustomRichText(
            title: '${LocalizationKeys.weeklyLecture.tr}: ',
            value: course.weeklyLecture.trim(),
            fontSize: 12.sp,
          ),
          Visibility(
            visible: course.note != null,
            child: Column(
              children: [
                SizedBox(height: 6.h),
                CustomRichText(
                  title: '${LocalizationKeys.note.tr}: ',
                  value: course.note ?? '',
                  fontSize: 12.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
