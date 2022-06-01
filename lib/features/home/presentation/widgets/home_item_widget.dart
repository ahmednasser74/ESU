import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({
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
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: color.withOpacity(.2),
          borderRadius: BorderRadius.circular(10.w),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              amount,
              style: TextStyle(
                color: color,
                fontSize: 16.sp,
              ),
            ),
            Text(
              LocalizationKeys.aed.tr,
              style: TextStyle(
                color: color,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
