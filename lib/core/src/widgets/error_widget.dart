import 'package:esu/core/src/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    Key? key,
    this.errorMessage,
  }) : super(key: key);
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            height: 1.sh -
                MediaQuery.of(context).padding.top -
                (AppBar().preferredSize.height * 2),
            child: Center(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        Assets.lottie.error,
                        height: .5.sh,
                        width: .7.sw,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        errorMessage ??
                            'حدث خطأ ما، تأكد من\nالإتصال بالإنترنت ثم أعد المحاولة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
