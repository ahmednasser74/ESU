import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CannotAddReplyWidget extends StatelessWidget {
  const CannotAddReplyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 12,
      ),
      decoration: CustomStyle.containerShadowDecoration.copyWith(
        border: Border.all(color: Colors.red),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning_rounded, color: Colors.red),
          SizedBox(width: 8.w),
          Text(
            LocalizationKeys.sorryCannotAddReplyBecauseTicketIsClosed.tr,
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
