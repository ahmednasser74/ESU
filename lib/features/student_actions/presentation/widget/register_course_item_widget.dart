import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/styles.dart';
import 'package:boilerplate/core/src/widgets/custom_rich_text.dart';
import 'package:boilerplate/features/student_actions/data/models/response/course_register/course_register_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisteredCourseItemWidget extends StatelessWidget {
  const RegisteredCourseItemWidget({
    Key? key,
    required this.course,
    required this.onTapRemoveCourse,
  }) : super(key: key);
  final CourseRegisterDataResponseModel course;
  final VoidCallback onTapRemoveCourse;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: CustomStyle.containerShadowDecoration.copyWith(
        border: Border.all(color: AppColors.primaryLightColor),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CustomRichText(
                  title: '${LocalizationKeys.courseName.tr}: ',
                  value: course.name,
                ),
                CustomRichText(
                  title: '${LocalizationKeys.hours.tr}: ',
                  value: course.hours.toString(),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: onTapRemoveCourse,
            icon: Icon(Icons.delete_outline_rounded, color: Colors.red[900]),
          )
        ],
      ),
    );
  }
}
