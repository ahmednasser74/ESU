import 'dart:ui';

import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatefulWidget {
  final void Function() onTapLogout;

  const LogoutDialog({
    Key? key,
    required this.onTapLogout,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => LogoutDialogState();

  Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (_) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 2.5,
            sigmaY: 2.5,
          ),
          child: LogoutDialog(
            onTapLogout: onTapLogout,
          ),
        );
      },
    );
  }
}

class LogoutDialogState extends State<LogoutDialog> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 220,
      ),
    );
    scaleAnimation = controller.view;
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: WillPopScope(
        onWillPop: () async {
          await controller.reverse();
          return Future.value(true);
        },
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20.r),
            padding: EdgeInsets.all(16.r),
            decoration: ShapeDecoration(
              color: Get.isDarkMode ? AppColors.darkModeGreyColor : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Text(
                    LocalizationKeys.logout.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  child: Text(
                    LocalizationKeys.doYouWantToLogout.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: AppButton(
                        onPressed: widget.onTapLogout,
                        title: LocalizationKeys.logout.tr,
                        fonSize: 12.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: AppButton(
                        onPressed: () async {
                          await controller.reverse();
                          Get.back();
                        },
                        title: LocalizationKeys.cancel.tr,
                        fonSize: 12.sp,
                        textColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                        backgroundColor: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
