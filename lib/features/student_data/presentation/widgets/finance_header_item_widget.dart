import 'package:esu/core/localization/localization_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/src/widgets/app_container.dart';

class FinanceHeaderItemWidget extends StatelessWidget {
  const FinanceHeaderItemWidget({
    Key? key,
    required this.title,
    required this.amount,
    required this.textColor,
    required this.backgroundColor,
  }) : super(key: key);

  final String title;
  final String amount;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppContainer(
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        height: 70.h,
        color: backgroundColor,
        boxShadowBlurColor: backgroundColor,
        hasBorder: false,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              amount,
              style: TextStyle(
                color: textColor,
                fontSize: 14.sp,
              ),
            ),
            Text(
              LocalizationKeys.aed.tr,
              style: TextStyle(color: textColor, fontSize: 8.sp),
            ),
          ],
        ),
      ),
    );
  }
}
