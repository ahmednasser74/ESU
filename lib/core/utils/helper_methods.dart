import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  static ScaffoldFeatureController showSnackBar({
    required BuildContext context,
    required String message,
    Color? color,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
            ),
            child: Text(message),
          ),
        ),
      );

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
