import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleRequiredFieldWidget extends StatelessWidget {
  const TitleRequiredFieldWidget({
    Key? key,
    required this.title,
    this.titleSize,
  }) : super(key: key);
  final String title;
  final double? titleSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(fontSize: titleSize ?? 16.sp),
          ),
          Text(
            '*',
            style: TextStyle(color: Colors.red, fontSize: titleSize ?? 16.sp),
          ),
        ],
      ),
    );
  }
}
