import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_data/presentation/controller/study_plans_controller.dart';
import 'package:esu/features/student_data/presentation/widgets/study_plans_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StudyPlansScreen extends GetView<StudyPlansController> {
  const StudyPlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.studyPlans.tr)),
      body: controller.obx(
        (state) => Column(
          children: [
            Text(
              '${state?.programName}',
              style: TextStyle(fontSize: 14.sp),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.separated(
                itemCount: state?.programData.length ?? 0,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                separatorBuilder: (context, index) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final item = state?.programData.elementAt(index);
                  return StudyPlansItemWidget(
                    programData: item!,
                  );
                },
              ),
            ),
          ],
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noStudyPlansFound.tr),
      ),
    );
  }
}
