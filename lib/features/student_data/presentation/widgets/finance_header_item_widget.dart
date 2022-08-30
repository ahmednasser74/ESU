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
    required this.color,
  }) : super(key: key);

  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppContainer(
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        padding: EdgeInsets.all(8.r),
        height: 80.h,
        color: color.withOpacity(.2),
        boxShadowBlurColor: color.withOpacity(.2),
        hasBorder: false,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              amount,
              style: TextStyle(
                color: color,
                fontSize: 14.sp,
              ),
            ),
            Text(
              LocalizationKeys.aed.tr,
              style: TextStyle(color: color, fontSize: 8.sp),
            ),
          ],
        ),
      ),
    );
  }
}
