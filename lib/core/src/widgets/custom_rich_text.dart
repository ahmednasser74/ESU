import 'package:esu/core/src/colors.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.title,
    required this.value,
    this.fontSize = 14.0,
    this.titleColor,
    this.valueColor = Colors.black,
  }) : super(key: key);
  final String title;
  final String value;
  final double? fontSize;
  final Color? titleColor, valueColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: titleColor ?? Theme.of(context).primaryColor,
          fontFamily: 'din',
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: valueColor,
              fontSize: fontSize,
              fontFamily: 'din',
            ),
          ),
        ],
      ),
    );
  }
}
