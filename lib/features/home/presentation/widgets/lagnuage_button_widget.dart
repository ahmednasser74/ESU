import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageButtonWidget extends StatelessWidget {
  const LanguageButtonWidget({
    Key? key,
    required this.onTap,
    required this.language,
    required this.color,
  }) : super(key: key);
  final VoidCallback onTap;
  final String language;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(language, style: TextStyle(color: color)),
        ),
      ),
    );
  }
}
