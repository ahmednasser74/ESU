import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.title,
    required this.value,
    this.fontSize = 14.0,
  }) : super(key: key);
  final String title;
  final String value;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontFamily: 'din',
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSize,
              fontFamily: 'din',
            ),
          ),
        ],
      ),
    );
  }
}
