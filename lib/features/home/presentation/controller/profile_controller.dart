import 'dart:io';

import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/mixin/file_properties.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/home/data/models/request/edit_profile_request_model.dart';
import 'package:esu/features/home/data/models/response/chec_profile_files/check_edit_profile_files_data_response_model.dart';
import 'package:esu/features/home/domin/usecases/check_edit_profile_files_usecase.dart';
import 'package:esu/features/home/domin/usecases/edit_profile_usecase.dart';
import 'package:esu/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ProfileController extends GetxController with FileProperties {
  ProfileController({
    required this.checkEditProfileFilesUseCase,
    required this.editProfileUseCase,
  });

  final CheckEditProfileFilesUseCase checkEditProfileFilesUseCase;
  final EditProfileUseCase editProfileUseCase;
  final bool? haveUnCompleteFiles = Get.arguments ?? false;

  final formKey = GlobalKey<FormState>();
  final fullNameEnTEC = TextEditingController(text: '');
  final fullNameArTEC = TextEditingController(text: '');
  final mobileTEC = TextEditingController(text: '');
  final emailTEC = TextEditingController(text: '');
  final passwordTEC = TextEditingController(text: '');
  final confirmPasswordTEC = TextEditingController(text: '');
  final facebookController = TextEditingController(text: '');
  final twitterController = TextEditingController(text: '');
  final instagramController = TextEditingController(text: '');
  final linkedinController = TextEditingController(text: '');
  final whatsappController = TextEditingController(text: '');
  final whatsappController2 = TextEditingController(text: '');
  final whatsappController3 = TextEditingController(text: '');
  final whatsAppPinController = TextEditingController(text: '');
  CheckEditProfileFilesDataResponseModel? checkEditProfileData;
  String errorMessage = '';
  File? photoFile;
  String? photoUrl;
  File? nationalPassportFile;
  File? latestAcademicQualificationFile;
  File? transcriptFile;
  File? contractFile;
  File? cvFile;
  String? password;
  String? passwordConfirm;
  late bool isAgreeToPublishPersonalInfo;
  bool isLoadingUpdateProfile = false;
  bool isError = false;

  @override
  void onInit() async {
    super.onInit();
    final student = SharedPrefs.instance.getUser();
    isAgreeToPublishPersonalInfo = student.publishSocialProfile;
    print('student data: ${student.publishSocialProfile}');
    fullNameEnTEC.text = student.nameEn;
    fullNameArTEC.text = student.nameAr;
    mobileTEC.text = student.mobile;
    emailTEC.text = student.email;
    photoUrl = student.photo;
    facebookController.text = student.facebook ?? '';
    twitterController.text = student.twitter ?? '';
    instagramController.text = student.instagram ?? '';
    linkedinController.text = student.linkedin ?? '';
    whatsappController.text = student.whatsNumber ?? '';
    whatsappController2.text = student.whatsNumber2 ?? '';
    whatsappController3.text = student.whatsNumber3 ?? '';
    whatsAppPinController.text = student.whatsPin ?? '';
    await checkEditProfileFiles();
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
      photo: photoFile,
      facebook: facebookController.text,
      twitter: twitterController.text,
      instagram: instagramController.text,
      linkedin: linkedinController.text,
      whatsapp: whatsappController.text,
      whatsapp2: whatsappController2.text,
      whatsapp3: whatsappController3.text,
      whatsappPin: whatsAppPinController.text,
      isAgreeToPublishPersonalInfo: isAgreeToPublishPersonalInfo,
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
          HelperMethod.showSnackBar(title: LocalizationKeys.success.tr, message: r.message!);
          SharedPrefs.instance.saveUser(studentModel: r.data);
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
          HelperMethod.showToast(
            msg: r.message!,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      },
    );
    isLoadingUpdateProfile = false;
    update();
  }

  Future<void> pickPhoto({required ImageSource source}) async {
    final imagePath = await pickedImage(source: source);
    if (imagePath != null) {
      photoFile = File(imagePath);
      update();
    }
  }

  String getFirstChar(String name) => name.isNotEmpty ? name.trim().split(' ').map((l) => l[0]).take(2).join() : '';

  Future<bool> onBack() {
    if (haveUnCompleteFiles!) {
      Get.find<HomeController>().getHomeData();
    }
    return Future.value(true);
  }
}
