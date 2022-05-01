import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              const Text(
                'Paid :',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              SizedBox(width: 8.w),
              const Text('\$1,000.00'),
              const Spacer(),
              const Text(
                'Status :',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              SizedBox(width: 8.w),
              const Text('Paid'),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              const Text(
                'Paid At :',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              SizedBox(width: 8.w),
              const Text('12/12/2020'),
              const Spacer(),
              const Text(
                'Total :',
                style: TextStyle(color: AppColors.primaryColor),
              ),
              SizedBox(width: 8.w),
              const Text('\$1,000.00'),
            ],
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
