import 'dart:io';

import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/mixin/file_properties.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/home/data/models/request/edit_profile_request_model.dart';
import 'package:boilerplate/features/home/data/models/response/chec_profile_files/check_edit_profile_files_data_response_model.dart';
import 'package:boilerplate/features/home/domin/usecases/check_edit_profile_files_usecase.dart';
import 'package:boilerplate/features/home/domin/usecases/edit_profile_usecase.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with FileProperties {
  ProfileController({
    required this.checkEditProfileFilesUseCase,
    required this.editProfileUseCase,
  });

  final CheckEditProfileFilesUseCase checkEditProfileFilesUseCase;
  final EditProfileUseCase editProfileUseCase;

  final fullNameEnTEC = TextEditingController();
  final fullNameArTEC = TextEditingController();
  final mobileTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final passwordTEC = TextEditingController();
  final confirmPasswordTEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? imageFile;
  String? photoUrl;
  bool isLoadingUpdateProfile = false;
  bool isError = false;
  String errorMessage = '';
  CheckEditProfileFilesDataResponseModel? checkEditProfileData;

  File? nationalPassportFile;
  File? latestAcademicQualificationFile;
  File? transcriptFile;
  File? contractFile;
  File? cvFile;
  String? password;
  String? passwordConfirm;

  @override
  void onInit() async {
    super.onInit();
    final student = SharedPrefs.instance.getUser().student;
    fullNameEnTEC.text = student.nameEn;
    fullNameArTEC.text = student.nameAr;
    mobileTEC.text = student.mobile;
    emailTEC.text = student.email;
    photoUrl = student.photo;
    await checkEditProfileFiles();
  }

  Future<void> pickPhoto({required ImageSource source}) async {
    final imagePath = await pickedImage(source: source);
    if (imagePath != null) {
      imageFile = File(imagePath);
      update();
    }
  }

  Future<void> editProfile() async {
    final requestMode = EditProfileRequestModel(
      password: password,
      passwordConfirmation: passwordConfirm,
      nationalPassportFile: nationalPassportFile,
      latestAcademicQualificationFile: latestAcademicQualificationFile,
      transcriptFile: transcriptFile,
      contractFile: contractFile,
      cvFile: cvFile,
    );
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      await _editProfile(requestMode);
    }
  }

  Future<void> _editProfile(EditProfileRequestModel requestModel) async {
    isLoadingUpdateProfile = true;
    update();
    final checkResponse = await editProfileUseCase(params: requestModel);
    checkResponse.fold(
      (l) {
        errorMessage = l!;
        isError = true;
        HelperMethod.showToast(msg: l, gravity: ToastGravity.TOP);
      },
      (r) {
        if (r.status) {
          HelperMethod.showToast(msg: r.message!, gravity: ToastGravity.TOP);
          checkEditProfileFiles();
        } else {
          isError = true;
          HelperMethod.showToast(
            msg: r.message ?? LocalizationKeys.somethingWentWrongTryAgain,
          );
        }
      },
    );
    isLoadingUpdateProfile = false;
    update();
  }

  Future<void> checkEditProfileFiles() async {
    isLoadingUpdateProfile = true;
    update();
    final checkResponse = await checkEditProfileFilesUseCase(
      params: NoParams(),
    );
    checkResponse.fold(
      (l) {
        errorMessage = l!;
        HelperMethod.showToast(msg: l, gravity: ToastGravity.TOP);
        isError = true;
      },
      (r) {
        if (r.status) {
          checkEditProfileData = r.data;
        } else {
          isError = true;
        }
      },
    );
    isLoadingUpdateProfile = false;
    update();
  }
}
