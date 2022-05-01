import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FinanceItemWidget extends StatelessWidget {
  const FinanceItemWidget({
    Key? key,
  }) : super(key: key);

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
          const Text('Excuse for Mid-Term - Final Exams'),
          SizedBox(height: 8.h),
          Row(
            children: [
              Text(
                '${LocalizationKeys.paid.tr} :',
                style: const TextStyle(color: AppColors.primaryColor),
              ),
              SizedBox(width: 8.w),
              const Text('\$1,000.00'),
              const Spacer(),
              Text(
                '${LocalizationKeys.status.tr} :',
                style: const TextStyle(color: AppColors.primaryColor),
              ),
              SizedBox(width: 8.w),
               Text(LocalizationKeys.paid.tr),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: '${LocalizationKeys.paidAt.tr} : ',
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontFamily: 'din',
                  ),
                  children: const [
                    TextSpan(
                      text: '12/12/2020',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'din',
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '${LocalizationKeys.total.tr} : ',
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontFamily: 'din',
                  ),
                  children: const [
                    TextSpan(
                      text: '\$1,000.00',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'din',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
