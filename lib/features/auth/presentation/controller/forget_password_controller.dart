import 'package:boilerplate/features/auth/domin/usecases/forget_password_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  ForgetPasswordController({
    required this.forgetPasswordUseCase,
  });

  final ForgetPasswordUseCase forgetPasswordUseCase;

  final forgetPasswordEmailTEC = TextEditingController();
}
