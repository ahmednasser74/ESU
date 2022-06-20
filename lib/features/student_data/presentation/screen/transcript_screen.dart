import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/app_warning_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_data/presentation/controller/transcript_controller.dart';
import 'package:esu/features/student_data/presentation/widgets/transcript_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TranscriptScreen extends GetView<TranscriptController> {
  const TranscriptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.transcript.tr)),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state!.data.length,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
          separatorBuilder: (_, index) => SizedBox(height: 14.h),
          itemBuilder: (_, index) => TranscriptItemWidget(
            transcriptItem: state.data.elementAt(index),
          ),
        ),
        onError: (e) => AppWarningWidget(message: e.toString()),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noLectureFound.tr),
      ),
    );
  }
}
