import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessfulAdmissionScreen extends StatefulWidget {
  const SuccessfulAdmissionScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfulAdmissionScreen> createState() =>
      _SuccessfulAdmissionScreenState();
}

class _SuccessfulAdmissionScreenState extends State<SuccessfulAdmissionScreen> {
  bool repeatAnimation = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () => setState(() => repeatAnimation = false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Successful Admission'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Congratulation you had Successful Admission',
                style: TextStyle(
                  fontSize: 22.sp,
                  color: Theme.of(context).primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14.h),
              Text(
                'Wait to our confirmation email',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 14.h),
              const Text(
                'You will be redirect to Login page',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 14.h),
              AppButton(
                onPressed: () => Get.offNamed(Routes.loginScreen),
                title: 'GO',
                minimumSize: const Size(double.infinity, 50),
                marginHorizontal: 18.w,
              )
            ],
          ),
          Visibility(
            visible: repeatAnimation,
            child: Lottie.asset(
              Assets.lottie.celelbration,
              width: 1.sw,
              height: 1.sh,
              fit: BoxFit.fill,
              repeat: repeatAnimation,
            ),
          ),
        ],
      ),
    );
  }
}
