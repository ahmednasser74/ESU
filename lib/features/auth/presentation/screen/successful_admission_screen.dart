import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessfulAdmissionScreen extends StatelessWidget {
  const SuccessfulAdmissionScreen({Key? key}) : super(key: key);

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
              const Text('Congratulation you had Successful Admission'),
              const Text('wait to our confirmation email'),
              const Text('you will be redirect to Login page'),
              AppButton(
                onPressed: () => Get.offNamed(Routes.loginScreen),
                title: 'GO',
              )
            ],
          ),
          Lottie.asset(
            Assets.lottie.celelbration,
            width: 1.sw,
            height: 1.sh,
            repeat: false,
          ),
        ],
      ),
    );
  }
}
