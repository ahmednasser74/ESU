import 'dart:io';

import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_rich_text.dart';
import 'package:boilerplate/features/student_data/data/models/response/finance/finance_data_response_model.dart';
import 'package:boilerplate/features/student_data/presentation/controller/finance_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FinanceItemWidget extends StatelessWidget {
  const FinanceItemWidget({
    Key? key,
    required this.finance,
    required this.index,
  }) : super(key: key);
  final int index;
  final FinanceDataResponseModel finance;

  @override
  Widget build(BuildContext context) {
    bool isLoadingPayment = finance.isLoadingToPaymentGateway;
    return Container(
      padding: EdgeInsets.only(left: 18.w, right: 18.w, top: 12.h, bottom: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primaryColor),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          FittedBox(child: Text(finance.item)),
          SizedBox(height: 8.h),
          Row(
            children: [
              CustomRichText(
                title: '${LocalizationKeys.paid.tr} : ',
                value: finance.paidAmount.toString(),
              ),
              const Spacer(),
              CustomRichText(
                title: '${LocalizationKeys.status.tr} : ',
                value: finance.status,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRichText(
                title: '${LocalizationKeys.paidAt.tr} : ',
                value: finance.paidAt ?? finance.status,
              ),
              CustomRichText(
                title: '${LocalizationKeys.total.tr} : ',
                value: finance.total.toString(),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRichText(
                title: '${LocalizationKeys.dueDate.tr} : ',
                value: finance.dueDate ?? LocalizationKeys.notPutTillNow.tr,
              ),
              CustomRichText(
                title: '${LocalizationKeys.remaining.tr} : ',
                value: finance.remaining.toString(),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Visibility(
            visible: finance.originalStatus == 'unpaid',
            child: GetBuilder<FinanceController>(
              builder: (controller) => OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: AppColors.primaryColor),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: isLoadingPayment
                    ? () {}
                    : () async => await controller.payInvoiceUrl(
                          invoiceId: finance.id,
                          index: index,
                        ),
                label: isLoadingPayment
                    ? Text(LocalizationKeys.waiting.tr)
                    : Text(LocalizationKeys.pay.tr),
                icon: isLoadingPayment
                    ? SizedBox(
                        height: 12.h,
                        width: 12.w,
                        child: const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                          strokeWidth: 1.5,
                        ),
                      )
                    : const Icon(Icons.attach_money),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({
    Key? key,
    required this.paymentUrl,
  }) : super(key: key);

  final String paymentUrl;

  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.payment.tr)),
      body: WebView(
        initialUrl: widget.paymentUrl,
        javascriptMode: JavascriptMode.unrestricted,
        zoomEnabled: true,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    Future.delayed(Duration.zero, () {
      Get.find<FinanceController>().getFinance();
    });
  }
}
