import 'package:esu/core/cache/cache.dart';
import 'package:esu/core/dependencies/dependency_init.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/features/auth/data/model/data_holder/academic_info_data_holder_model.dart';
import 'package:esu/features/auth/data/model/data_holder/file_upload_data_holder_model.dart';
import 'package:esu/features/auth/data/model/data_holder/personal_info_data_holder_model.dart';
import 'package:esu/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:esu/features/auth/domin/usecases/admission_usecase.dart';
import 'package:get/get.dart';

import '../../../../core/const/shared_prefs_keys.dart';

class SubmitAdmissionController extends GetxController {
  SubmitAdmissionController({
    required this.admissionUseCase,
  });

  final AdmissionUseCase admissionUseCase;

  late AcademicInformationDataHolderModel academicInfo;
  late PersonalInformationDataHolderModel personalInfo;
  late FileUploadDataHolder fileUploadInfo;
  RxBool isTermsAndConditionApproved = false.obs;
  RxBool loadingIndicator = false.obs;

  void submitAdmission() async {
    if (isTermsAndConditionApproved.value == true) {
      loadingIndicator.value = true;
      final response = await admissionUseCase(params: requestModel());
      response.fold(
        (l) {
          loadingIndicator.value = false;
          HelperMethod.showToast(msg: l!);
        },
        (r) {
          if (r.status == true) {
            HelperMethod.showToast(msg: LocalizationKeys.success.tr);
            loadingIndicator.value = false;
            Get.offAllNamed(Routes.successfulAdmissionScreen);
          } else {
            loadingIndicator.value = false;
            HelperMethod.showToast(msg: r.message);
          }
        },
      );
    } else {
      HelperMethod.showToast(
        msg: LocalizationKeys.mustToApproveOnTermsAndCondition.tr,
      );
    }
  }

  AdmissionRequestModel requestModel() {
    final CacheHelper cacheHelper = getIt<CacheHelper>();
    academicInfo = AcademicInformationDataHolderModel.fromJson(cacheHelper.get(SharedPrefsKeys.academicInfoRegister));
    personalInfo = PersonalInformationDataHolderModel.fromJson(cacheHelper.get(SharedPrefsKeys.personalInfoRegister));
    fileUploadInfo = FileUploadDataHolder.fromJson(cacheHelper.get(SharedPrefsKeys.fileUploadInfoRegister));
    final requestModel = AdmissionRequestModel(
      currentCertificate: academicInfo.currentCertificate,
      programId: academicInfo.programId,
      email: personalInfo.email,
      //-----------------------------------------------------
      firstNameEnglish: personalInfo.firstNameEnglish,
      lastNameEnglish: personalInfo.lastNameEnglish,
      secondNameEnglish: personalInfo.secondNameEnglish,
      firstNameArabic: personalInfo.firstNameArabic,
      secondNameArabic: personalInfo.secondNameArabic,
      lastNameArabic: personalInfo.lastNameArabic,
      nationalPassport: personalInfo.nationalPassport,
      mobileNumber: personalInfo.mobileNumber,
      birthDate: personalInfo.birthDate,
      gender: personalInfo.gender,
      countryId: personalInfo.countryId,
      nationalityId: personalInfo.nationalityId,
      yourJob: personalInfo.yourJob,
      yourCompany: personalInfo.yourCompany,
      currentAddress: personalInfo.currentAddress,
      //-----------------------------------------------------
      nationalPassportFile: fileUploadInfo.nationalPassportFile,
      latestAcademicQualificationFile: fileUploadInfo.latestAcademicQualificationFile,
      transcriptFile: fileUploadInfo.transcriptFile,
      contractFile: fileUploadInfo.contractFile,
      cvFile: fileUploadInfo.cvFile,
      rule: fileUploadInfo.rule,
    );
    return requestModel;
  }
}
