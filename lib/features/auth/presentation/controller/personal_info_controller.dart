import 'package:boilerplate/core/const/lookup_const.dart';
import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/auth/data/model/data_holder/personal_info_data_holder_model.dart';
import 'package:boilerplate/features/auth/data/model/request/lookup/lookup_request_model.dart';
import 'package:boilerplate/features/auth/data/model/response/lookup/lookup_data_response_model.dart';
import 'package:boilerplate/features/auth/domin/usecases/lookup_use_case.dart';
import 'package:boilerplate/features/auth/presentation/controller/submit_admission_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController
    with StateMixin<List<LookupDataResponseModel>> {
  PersonalInfoController({required this.lookupUseCase});

  LookupUseCase lookupUseCase;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: '');
  final yourFirstNameEnController = TextEditingController(text: '');
  final yourLastNameEnController = TextEditingController(text: '');
  final yourSecondNameEnController = TextEditingController(text: '');
  final yourFirstNameArController = TextEditingController(text: '');
  final yourLastNameArController = TextEditingController(text: '');
  final yourSecondNameArController = TextEditingController(text: '');
  final phoneNumberController = TextEditingController(text: '');
  final nationalPassportController = TextEditingController(text: '');
  final genderController = TextEditingController(text: '');
  final jobController = TextEditingController(text: '');
  final companyController = TextEditingController(text: '');
  final addressController = TextEditingController(text: '');
  late DateTime birthDateController;
  late int countryId;
  late int nationalityId;

  @override
  void onInit() async {
    super.onInit();
    await getLookupNationality();
  }

  Future<void> getLookupNationality() async {
    change(null, status: RxStatus.loading());
    final requestModel = LookupRequestModel(
      lookupType: LookupConst.nationalities,
    );
    final nationalityData = await lookupUseCase(params: requestModel);
    nationalityData.fold(
      (l) => change(null, status: RxStatus.error()),
      (r) {
        if (r.status == true) {
          change(r.data, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error());
        }
      },
    );
  }

  void goToUploadFilesScreen() {
    if (formKey.currentState!.validate()) {
      setData();
      Get.toNamed(Routes.registerFileUploadScreen);
    } else {
      HelperMethod.showToast(msg: LocalizationKeys.completeAllTheFields.tr);
    }
  }

  void setData() {
    final submitAdmission = Get.find<SubmitAdmissionController>();
    submitAdmission.personalInfo = PersonalInformationDataHolderModel(
      email: emailController.text,
      firstNameEnglish: yourFirstNameEnController.text,
      lastNameEnglish: yourLastNameEnController.text,
      secondNameEnglish: yourSecondNameEnController.text,
      firstNameArabic: yourFirstNameArController.text,
      secondNameArabic: yourSecondNameArController.text,
      lastNameArabic: yourLastNameArController.text,
      nationalPassport: nationalPassportController.text,
      mobileNumber: phoneNumberController.text,
      birthDate: birthDateController.toIso8601String(),
      gender: genderController.text,
      countryId: countryId,
      nationalityId: nationalityId,
      currentAddress: addressController.text,
      yourJob: jobController.text,
      yourCompany: companyController.text,
    );
  }
}
