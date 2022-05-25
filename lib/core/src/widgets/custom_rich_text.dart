import 'package:boilerplate/core/src/colors.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontFamily: 'din',
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'din',
            ),
          ),
        ],
      ),
    );
  }
}
