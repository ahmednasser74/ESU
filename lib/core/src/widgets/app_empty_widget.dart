import 'package:esu/core/src/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset(Assets.lottie.empty, height: .5.sh)),
          Text(title),
        ],
      ),
    );
  }
}
