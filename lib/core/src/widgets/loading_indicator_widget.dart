import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../styles.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({Key? key, this.withScaffold = true}) : super(key: key);
  final bool withScaffold;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: withScaffold,
      builder: (context) => Scaffold(
        body: Center(
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: CustomStyle.containerShadowDecoration,
            padding: const EdgeInsets.all(14),
            child: Lottie.asset(Assets.lottie.loading),
          ),
        ),
      ),
      fallback: (context) => Center(
        child: Container(
          height: 100.h,
          width: 100.w,
          decoration: CustomStyle.containerShadowDecoration,
          padding: const EdgeInsets.all(14),
          child: Lottie.asset(Assets.lottie.loading),
        ),
      ),
    );
  }
}
