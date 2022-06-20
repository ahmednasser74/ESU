import 'dart:io';

import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpdateAppDialog extends StatelessWidget {
  const UpdateAppDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: Platform.isAndroid,
      builder: (_) => Dialog(
        child: Container(
          height: .25.sh,
          padding: EdgeInsets.all(20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocalizationKeys.thereInAnUpdateAvailable.tr,
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(height: 14.h),
              Text(
                LocalizationKeys.youShouldUpdateTheAppToContinueUsingIt.tr,
              ),
              SizedBox(height: 26.h),
              AppButton(
                title: LocalizationKeys.update.tr,
                backgroundColor: Colors.white,
                borderColor: AppColors.primaryColor,
                textColor: AppColors.primaryColor,
                paddingVertical: 0,
                onPressed: goToStore,
              ),
            ],
          ),
        ),
      ),
      fallback: (_) => CupertinoAlertDialog(
        title: Text(LocalizationKeys.thereInAnUpdateAvailable.tr),
        content: Text(
          LocalizationKeys.youShouldUpdateTheAppToContinueUsingIt.tr,
        ),
        actions: [
          CupertinoDialogAction(
            child: Text(LocalizationKeys.update.tr),
            onPressed: goToStore,
          ),
        ],
      ),
    );
  }

  goToStore() {
    if (Platform.isAndroid) {
    } else {}
  }
}
