import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/app_warning_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_actions/presentation/controller/courses_registered_controller.dart';
import 'package:esu/features/student_actions/presentation/widget/register_course_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CourseRegisteredScreen extends GetView<CourseRegisteredController> {
  const CourseRegisteredScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.editCourses.tr)),
      body: controller.obx(
        (state) => Scaffold(
            floatingActionButton: Visibility(
              visible: state!.data!.isNotEmpty,
              child: FloatingActionButton.extended(
                onPressed: () => Get.toNamed(Routes.addCourseScreen),
                icon: const Icon(Icons.add_outlined),
                label: Text(LocalizationKeys.addCourse.tr),
              ),
            ),
            body: ListView.separated(
              itemCount: state.data!.length,
              itemBuilder: (context, index) => RegisteredCourseItemWidget(
                course: state.data!.elementAt(index),
                onTapRemoveCourse: () => controller.onTapRemoveCourse(
                  courseId: state.data!.elementAt(index).id,
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 18.h),
            ),
          ),
        onLoading: const LoadingIndicatorWidget(),
        onError: (e) => AppWarningWidget(message: e.toString()),
        onEmpty: AppEmptyWidget(
          title: LocalizationKeys.noCoursesRegistered.tr,
        ),
      ),
    );
  }
}
