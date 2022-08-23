import 'package:esu/core/extentions/spaces_box.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitleRequiredFieldWidget extends StatelessWidget {
  const TitleRequiredFieldWidget({
    Key? key,
    required this.title,
    this.titleSize,
    this.isRequired = true,
    this.icon,
  }) : super(key: key);
  final String title;
  final double? titleSize;
  final bool isRequired;
  final String? icon;

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
          8.widthBox,
          ConditionalBuilder(
            condition: icon != null,
            builder: (context) =>  SvgPicture.asset(icon!,height: 16.h,color: Colors.blueGrey),
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
