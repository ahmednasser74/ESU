import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/src/colors.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    Key? key,
    required this.child,
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
    this.color = AppColors.whiteColor,
    this.borderColor,
    this.borderWidth = 0,
    this.boxShadowBlurRadius = 4,
    this.borderRadius = 8,
    this.boxShadowOffset = Offset.zero,
    this.boxShadowBlurColor,
    this.hasShadow = true,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.alignment,
    this.hasBorder = true,
    this.shadowSpreadRadius = 0,
    this.constraints,
  }) : super(key: key);

  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final Color color;
  final Color? borderColor;
  final double borderWidth;
  final Offset? boxShadowOffset;
  final double boxShadowBlurRadius;
  final Color? boxShadowBlurColor;
  final bool hasShadow;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final bool hasBorder;
  final double shadowSpreadRadius;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.h,
      width: width?.w,
      padding: padding,
      margin: margin,
      alignment: alignment,
      constraints: constraints,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: hasBorder ? Border.all(color: borderColor ?? Theme.of(context).primaryColor, width: borderWidth) : null,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: boxShadowBlurColor?.withOpacity(.7) ?? Theme.of(context).colorScheme.secondary,
                  offset: boxShadowOffset ?? const Offset(0, 8),
                  blurRadius: 8,
                  spreadRadius: shadowSpreadRadius,
                )
              ]
            : null,
      ),
      child: child,
    );
  }
}
