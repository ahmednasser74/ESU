import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleRequiredFieldWidget extends StatelessWidget {
  const TitleRequiredFieldWidget({
    Key? key,
    required this.title,
    this.titleSize,
    this.isRequired = true,
  }) : super(key: key);
  final String title;
  final double? titleSize;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: .8.sw),
            child: Text(
              title,
              style: TextStyle(fontSize: titleSize ?? 16.sp),
            ),
          ),
          Visibility(
            visible: isRequired,
            child: Text(
              '*',
              style: TextStyle(color: Colors.red, fontSize: titleSize ?? 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
