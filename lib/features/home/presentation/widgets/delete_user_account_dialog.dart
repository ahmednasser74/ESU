import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DeleteUserAccountDialog extends StatelessWidget {
  const DeleteUserAccountDialog({
    Key? key,
    required this.onTapDeleteAccount,
  }) : super(key: key);
  final VoidCallback onTapDeleteAccount;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: .26.sh,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              LocalizationKeys.deleteUserAccount.tr,
              style: TextStyle(fontSize: 18.sp, color: Colors.red),
            ),
            Text(
              LocalizationKeys.ifYouDeleteYourAccountYouWillNotBeAbleToLoginAgain.tr,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(
                  title: LocalizationKeys.delete.tr,
                  backgroundColor: Colors.red,
                  textColor: AppColors.whiteColor,
                  paddingVertical: 0,
                  onPressed: () {
                    Get.back();
                    onTapDeleteAccount();
                  },
                ),
                AppButton(
                  title: LocalizationKeys.cancel.tr,
                  paddingVertical: 0,
                  onPressed: Get.back,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
