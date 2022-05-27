import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/widgets/app_empty_widget.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/student_data/presentation/controller/finance_controller.dart';
import 'package:boilerplate/features/student_data/presentation/widgets/finance_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FinanceScreen extends GetView<FinanceController> {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.finance.tr)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: controller.getFinancePayUrl,
        label: const Text('Pay'),
        icon: const Icon(Icons.attach_money),
      ),
      body: controller.obx(
        (state) => ListView.separated(
          itemCount: state?.length ?? 0,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          separatorBuilder: (context, index) => SizedBox(height: 14.h),
          itemBuilder: (context, index) => FinanceItemWidget(
            finance: state!.elementAt(index),
          ),
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noStudyPlansFound.tr),
      ),
    );
  }
}
