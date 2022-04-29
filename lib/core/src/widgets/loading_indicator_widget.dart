import 'package:flutter/material.dart';

import '../colors.dart';
import '../styles.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: CustomStyle.containerShadowDecoration,
      padding: const EdgeInsets.all(14),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
