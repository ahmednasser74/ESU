import 'package:flutter/material.dart';
import '../../../../core/src/colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    Key? key,
    required this.child,
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
    this.color = AppColors.whiteColor,
    this.borderColor = AppColors.primaryColor,
    this.borderWidth = 0,
    this.boxShadowBlurRadius = 4,
    this.borderRadius = 8,
    this.boxShadowOffset = Offset.zero,
    this.boxShadowBlurColor = Colors.blue,
  }) : super(key: key);

  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final Color color;
  final Color borderColor;
  final double borderWidth;
  final Offset? boxShadowOffset;
  final double boxShadowBlurRadius;
  final Color boxShadowBlurColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: borderWidth),
        boxShadow: [
          BoxShadow(
            color: boxShadowBlurColor,
            offset: boxShadowOffset ?? const Offset(1, 2),
            blurRadius: boxShadowBlurRadius,
          )
        ],
      ),
      child: child,
    );
  }
}
