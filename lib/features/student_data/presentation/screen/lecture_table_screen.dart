import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/app_warning_widget.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_data/presentation/controller/lecture_table_controller.dart';
import 'package:esu/features/student_data/presentation/widgets/lecture_table_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';

class LectureTableScreen extends GetView<LectureTableController> {
  const LectureTableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.lectureTable.tr)),
      body: controller.obx(
        (state) => Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(10.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                state!.data!.generalNote,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp,color: Colors.red),
              ),
            ),
            Expanded(
              child: ConditionalBuilder(
                condition: state.data!.courses!.isEmpty,
                builder: (context) => AppEmptyWidget(
                  title: LocalizationKeys.noLectureFound.tr,
                ),
                fallback: (_) => ListView.separated(
                  itemCount: state.data!.courses?.length ?? 0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
                  separatorBuilder: (_, index) => SizedBox(height: 14.h),
                  itemBuilder: (_, index) => LectureTableItemWidget(
                    course: state.data!.courses!.elementAt(index),
                  ),
                ),
              ),
            ),
          ],
        ),
        onError: (e) => AppWarningWidget(message: e.toString()),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noLectureFound.tr),
      ),
    );
  }
}
