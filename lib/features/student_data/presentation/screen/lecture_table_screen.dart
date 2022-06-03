import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/widgets/app_empty_widget.dart';
import 'package:boilerplate/core/src/widgets/custom_rich_text.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/student_data/data/models/response/lecture_table/lecture_table_course_response_model.dart';
import 'package:boilerplate/features/student_data/presentation/controller/lecture_table_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';

class LectureTableScreen extends GetView<LectureTableController> {
  const LectureTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture Table')),
      body: controller.obx(
        (state) => Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Text(
                state!.data.generalNote,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.separated(
                itemCount: state.data.courses.length,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                separatorBuilder: (_, index) => SizedBox(height: 14.h),
                itemBuilder: (_, index) => LectureTableItemWidget(
                  course: state.data.courses.elementAt(index),
                ),
              ),
            ),
          ],
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noDataFound.tr),
      ),
    );
  }
}

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
          CustomRichText(
            title: 'Course Code: ',
            value: course.courseCode,
          ),
          SizedBox(height: 6.h),
          CustomRichText(
            title: 'Doctor Name: ',
            value: course.doctorName,
          ),
          SizedBox(height: 6.h),
          CustomRichText(
            title: 'weekly_lecture: ',
            value: course.weeklyLecture.trim(),
          ),
          Visibility(
            visible: course.note != null,
            child: Column(
              children: [
                SizedBox(height: 6.h),
                CustomRichText(
                  title: 'note: ',
                  value: course.note ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
