import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperMethod {
  static void showToast({
    required String msg,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast toastLength = Toast.LENGTH_SHORT,
    Color backgroundColor = AppColors.primaryColor,
    Color textColor = AppColors.whiteColor,
    double fontSize = 16,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: gravity,
      fontSize: fontSize,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  static SnackbarController showSnackBar({
    required String message,
    required String title,
    int durationSeconds = 3,
    Color backgroundColor = Colors.white,
    Color textColor = Colors.black,
  }) {
    return Get.snackbar(
      title,
      message,
      colorText: textColor,
      duration: Duration(seconds: durationSeconds),
      backgroundColor: backgroundColor,
      borderColor: AppColors.primaryColor,
      borderWidth: 1.w,
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      boxShadows: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  static Future<void> launchToBrowser(
    String url, {
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: mode)) {
      throw 'Could not launch $uri';
    }
  }
}
