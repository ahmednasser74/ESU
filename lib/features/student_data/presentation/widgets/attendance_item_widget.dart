import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/styles.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:esu/core/src/widgets/custom_rich_text.dart';
import 'package:esu/features/student_data/data/models/response/attendance/attendance_item_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'attendance_alert_dialog.dart';

class AttendanceItemWidget extends StatelessWidget {
  const AttendanceItemWidget({
    Key? key,
    required this.attendance,
  }) : super(key: key);

  final AttendanceItemResponseModel attendance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
      decoration: CustomStyle.containerShadowDecoration.copyWith(
        border: Border.all(color: AppColors.primaryLightColor),
      ),
      child: Column(
        children: [
          Text(
            attendance.course,
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRichText(
                title: '${LocalizationKeys.status.tr}: ',
                value: attendance.status,
              ),
              CustomRichText(
                title: '${LocalizationKeys.absence.tr}: ',
                value: attendance.abcense.toString(),
              ),
            ],
          ),
          CustomRichText(
            title:
                '${LocalizationKeys.quizzes.tr}/${LocalizationKeys.finished.tr}: ',
            value:
                '${attendance.finished.toString()}/${attendance.total.toString()}',
          ),
          SizedBox(height: 12.h),
          AppButton(
            onPressed: () => Get.dialog(
              AttendanceDetailsDialog(attendanceDetails: attendance.details),
            ),
            title: LocalizationKeys.details.tr,
            fonSize: 16.sp,
            paddingVertical: 0,
            minimumSize: Size(double.infinity, 30.h),
          ),
        ],
      ),
    );
  }
}
