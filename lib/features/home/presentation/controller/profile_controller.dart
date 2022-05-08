import 'dart:io';

import 'package:boilerplate/core/mixin/file_properties.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with FileProperties {
  final fullNameEnController = TextEditingController();
  final fullNameArController = TextEditingController();
  final nationalPassportController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  File? imageFile;
  String? photoUrl;

  @override
  void onInit() {
    super.onInit();
    final student = SharedPrefs.instance.getUser().student;
    fullNameEnController.text = student.nameEn;
    fullNameArController.text = student.nameAr;
    nationalPassportController.text = student.nationalPassport;
    mobileController.text = student.mobile;
    emailController.text = student.email;
    photoUrl =
        'https://turbo-shipping.turbo-eg.com/assets/admin/images/portrait/small/avatar-s-11.jpg';
    // photoUrl = student.photo;
  }

  Future<void> pickPhoto({required ImageSource source}) async {
    final imagePath = await pickedImage(source: source);
    if (imagePath != null) {
      imageFile = File(imagePath);
      update();
    }
  }
}
