import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title, fontFamily;
  final Alignment alignment;
  final double elevation,
      fonSize,
      paddingHorizontal,
      paddingVertical,
      marginHorizontal,
      marginVertical,
      borderRadius;
  final FontWeight? fontWeight;
  final Widget? child;
  final Color textColor, backgroundColor, borderColor;
  final Size? minimumSize;

  const AppButton({
    required this.onPressed,
    this.title,
    this.alignment = Alignment.center,
    this.backgroundColor = AppColors.primaryColor,
    this.elevation = 0,
    this.child,
    this.paddingHorizontal = 20,
    this.paddingVertical = 10,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.textColor = AppColors.whiteColor,
    this.fonSize = 20,
    this.fontFamily = 'din',
    this.borderColor = Colors.transparent,
    this.borderRadius = 10,
    this.fontWeight,
    this.minimumSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: marginHorizontal,
        vertical: marginVertical,
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        child: child ??
            Text(
              title ?? '',
              style: theme.textTheme.headline1?.copyWith(
                fontSize: fonSize.sp,
                color: textColor,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
              ),
            ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
          minimumSize: minimumSize,
          side: BorderSide(color: borderColor),
          backgroundColor: backgroundColor,
          elevation: elevation,
          alignment: alignment,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
    );
  }
}
