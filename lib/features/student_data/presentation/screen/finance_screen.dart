import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_data/presentation/controller/finance_controller.dart';
import 'package:esu/features/student_data/presentation/widgets/finance_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FinanceScreen extends GetView<FinanceController> {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.finance.tr)),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state?.length ?? 0,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          separatorBuilder: (_, index) => SizedBox(height: 14.h),
          itemBuilder: (_, index) => FinanceItemWidget(
            finance: state!.elementAt(index),
            index: index,
          ),
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noDataFound.tr),
      ),
    );
  }
}
