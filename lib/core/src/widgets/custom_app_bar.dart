import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../colors.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? endIcon;
  final String centerTitle;
  final Color iconsColor, backgroundColor;

  const CustomAppBar({
    required this.centerTitle,
    this.endIcon,
    this.iconsColor = AppColors.primaryColor,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SizedBox(
            width: .08.sw,
            height: .08.sh,
            child: endIcon,
          ),
        )
      ],
      leading: InkWell(
        onTap: () => Get.back(),
        child: Icon(
          Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          color: iconsColor,
        ),
      ),
      shadowColor: Colors.transparent,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        centerTitle,
        style: textTheme.headline1?.copyWith(
          color: AppColors.primaryColor,
          fontSize: 24,
        ),
      ),
    );
  }
}
