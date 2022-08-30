import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/app_error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_data/presentation/controller/finance_controller.dart';
import 'package:esu/features/student_data/presentation/widgets/finance_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/finance_header_item_widget.dart';

class FinanceScreen extends GetView<FinanceController> {
  const FinanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onBack,
      child: Scaffold(
        appBar: AppBar(title: Text(LocalizationKeys.finance.tr)),
        body: controller.obx(
          (state) => Column(
            children: [
              Row(
                children: [
                  FinanceHeaderItemWidget(
                    color: Colors.blue,
                    title: LocalizationKeys.balance.tr,
                    amount: '20',
                  ),
                  FinanceHeaderItemWidget(
                    color: Colors.orangeAccent,
                    title: LocalizationKeys.totalAmount.tr,
                    amount: '20',
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                children: [
                  FinanceHeaderItemWidget(
                    color: Colors.green,
                    title: LocalizationKeys.totalAmountPaid.tr,
                    amount: '20',
                  ),
                  FinanceHeaderItemWidget(
                    color: Colors.red,
                    title: LocalizationKeys.totalAmountUnpaid.tr,
                    amount: '20',
                  ),
                ],
              ),
              SizedBox(height: 14.h),

              Expanded(
                child: ListView.separated(
                  itemCount: state?.length ?? 0,
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                  separatorBuilder: (_, index) => SizedBox(height: 14.h),
                  itemBuilder: (_, index) => FinanceItemWidget(
                    finance: state!.elementAt(index),
                    index: index,
                  ),
                ),
              ),
            ],
          ),
          onError: (e) => AppErrorWidget(errorMessage: e),
          onLoading: const LoadingIndicatorWidget(),
          onEmpty: AppEmptyWidget(title: LocalizationKeys.noDataFound.tr),
        ),
      ),
    );
  }
}
