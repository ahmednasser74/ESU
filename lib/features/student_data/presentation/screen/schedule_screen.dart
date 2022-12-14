import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/app_error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_data/presentation/controller/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';

class ScheduleScreen extends GetView<ScheduleController> {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.schedule.tr)),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state?.data.length ?? 0,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          separatorBuilder: (_, index) => SizedBox(height: 14.h),
          itemBuilder: (_, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.w,
                  blurRadius: 2.w,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(state!.data.elementAt(index)),
            ),
          ),
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noDataFound.tr),
      ),
    );
  }
}
