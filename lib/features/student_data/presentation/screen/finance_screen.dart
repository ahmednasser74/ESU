import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_container.dart';
import 'package:esu/core/src/widgets/app_empty_widget.dart';
import 'package:esu/core/src/widgets/app_error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_data/presentation/controller/finance_controller.dart';
import 'package:esu/features/student_data/presentation/widgets/finance_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widgets/finance_header_item_widget.dart';
import 'package:esu/core/localization/localization_keys.dart';

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
              SizedBox(height: 12.h),
              AppContainer(
                hasShadow: false,
                padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 20.w),
                child: Text('${LocalizationKeys.programAmount.tr} : ${state!.invoiceStatics.programCost}'),
              ),
              SizedBox(height: 14.h),
              Row(
                children: [
                  FinanceHeaderItemWidget(
                    color: Colors.blue,
                    title: LocalizationKeys.balance.tr,
                    amount: state.invoiceStatics.balance.toString(),
                  ),
                  FinanceHeaderItemWidget(
                    color: Colors.orangeAccent,
                    title: LocalizationKeys.totalAmount.tr,
                    amount: state.invoiceStatics.total.toString(),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                children: [
                  FinanceHeaderItemWidget(
                    color: Colors.green,
                    title: LocalizationKeys.totalAmountPaid.tr,
                    amount: state.invoiceStatics.paid.toString(),
                  ),
                  FinanceHeaderItemWidget(
                    color: Colors.red,
                    title: LocalizationKeys.totalAmountUnpaid.tr,
                    amount: state.invoiceStatics.unpaid.toString(),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Expanded(
                child: ListView.separated(
                  itemCount: state.data.length,
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                  separatorBuilder: (_, index) => SizedBox(height: 14.h),
                  itemBuilder: (_, index) => FinanceItemWidget(
                    finance: state.data.elementAt(index),
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
