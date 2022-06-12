import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/home/presentation/controller/popular_question_controller.dart';
import 'package:boilerplate/features/home/presentation/widgets/popular_question_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PopularQuestionScreen extends GetView<PopularQuestionController> {
  const PopularQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.faq.tr)),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: 5,
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
          separatorBuilder: (_, index) => SizedBox(height: 8.h),
          itemBuilder: (BuildContext context, int index) {
            return PopularQuestionItemWidget(question: state!.elementAt(index));
          },
        ),
        onLoading: const LoadingIndicatorWidget(),
        onError: (error) => AppErrorWidget(errorMessage: error.toString()),
      ),
    );
  }
}
