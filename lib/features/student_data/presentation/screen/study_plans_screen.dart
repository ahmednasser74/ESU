import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/features/student_data/presentation/controller/study_plans_controller.dart';
import 'package:boilerplate/features/student_data/presentation/widgets/study_plans_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class StudyPlansScreen extends GetView<StudyPlansController> {
  const StudyPlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.studyPlans.tr)),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
              itemBuilder: (context, index) =>
                  StudyPlanstItemWidget(index: index),
            ),
          ),
        ],
      ),
    );
  }
}
