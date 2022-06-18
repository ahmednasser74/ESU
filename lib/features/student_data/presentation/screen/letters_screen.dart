import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_data/presentation/controller/letters_controller.dart';
import 'package:esu/features/student_data/presentation/widgets/letter_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LettersScreen extends GetView<LettersController> {
  const LettersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.letters.tr)),
      body: controller.obx(
        (list) => ListView.separated(
          itemCount: list?.length ?? 0,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 6.h),
          separatorBuilder: (context, index) => SizedBox(height: 14.h),
          itemBuilder: (context, index) => LetterItemWidget(
            letter: list!.elementAt(index),
          ),
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noLettersFound.tr),
      ),
    );
  }
}
