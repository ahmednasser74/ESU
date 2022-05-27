import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_rich_text.dart';
import 'package:boilerplate/features/student_data/data/models/response/finance/finance_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FinanceItemWidget extends StatelessWidget {
  const FinanceItemWidget({
    Key? key,
    required this.finance,
  }) : super(key: key);
  final FinanceDataResponseModel finance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
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
                title: 'Due date : ',
                value: finance.dueDate,
              ),
              CustomRichText(
                title: 'Remaining : ',
                value: finance.remaining.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
