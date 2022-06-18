import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/widgets/app_warning_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/add_course_controller.dart';
import 'package:boilerplate/features/student_actions/presentation/widget/available_course_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddCourseScreen extends GetView<AddCourseController> {
  const AddCourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.addCourse.tr)),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state!.data.length,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
          itemBuilder: (context, index) => AvailableCourseItemWidget(
            course: state.data[index],
            onTapAddCourse: () => controller.addCourse(
              courseId: state.data[index].id,
            ),
          ),
          separatorBuilder: (context, index) => SizedBox(height: 18.h),
        ),
        onLoading: const LoadingIndicatorWidget(),
        onError: (e) => AppWarningWidget(message: e.toString()),
        onEmpty: AppWarningWidget(
          message: LocalizationKeys.noCoursesAvailable.tr,
        ),
      ),
    );
  }
}
