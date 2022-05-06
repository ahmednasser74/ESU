import 'package:boilerplate/features/auth/data/model/data_holder/academic_info_data_holder_model.dart';
import 'package:boilerplate/features/auth/data/model/data_holder/file_upload_data_holder_model.dart';
import 'package:boilerplate/features/auth/data/model/data_holder/personal_info_data_holder_model.dart';
import 'package:boilerplate/features/auth/data/model/request/admission/admission_request_model.dart';
import 'package:boilerplate/features/auth/domin/usecases/admission_usecase.dart';
import 'package:get/get.dart';

class SubmitAdmissionController extends GetxController {
  SubmitAdmissionController({
    required this.admissionUseCase,
  });

  final AdmissionUseCase admissionUseCase;

  late AcademicInformationDataHolderModel academicInfo;
  late PersonalInformationDataHolderModel personalInfo;
  late FileUploadDataHolder fileUploadInfo;
  RxBool isApproved = false.obs;
  RxBool loadingIndicator = false.obs;

  void submitAdmission() async {
    print('submitAdmission ${academicInfo.currentCertificate}');
    print('submitAdmission ${academicInfo.programId}');
    print('personalInfo.firstNameEnglish ${personalInfo.firstNameEnglish}');
    print('personalInfo.lastNameEnglish ${personalInfo.lastNameEnglish}');
    print('personalInfo.secondNameEnglish ${personalInfo.secondNameEnglish}');
    print('personalInfo.firstNameArabic ${personalInfo.firstNameArabic}');
    print('personalInfo.secondNameArabic ${personalInfo.secondNameArabic}');
    print('personalInfo.lastNameArabic ${personalInfo.lastNameArabic}');
    print('personalInfo.nationalPassport ${personalInfo.nationalPassport}');
    print('personalInfo.mobileNumber ${personalInfo.mobileNumber}');
    print('personalInfo.birthDate ${personalInfo.birthDate}');
    print('personalInfo.gender ${personalInfo.gender}');
    print('personalInfo.countryId ${personalInfo.countryId}');
    print('personalInfo.nationalityId ${personalInfo.nationalityId}');
    print('personalInfo.yourJob ${personalInfo.yourJob}');
    print('personalInfo.yourCompany ${personalInfo.yourCompany}');
    print('personalInfo.currentAddress ${personalInfo.currentAddress}');

    // loadingIndicator.value = true;
    // if (isApproved.value == true) {
    //   final response = await admissionUseCase(params: requestModel());
    //   response.fold(
    //     (l) {
    //       loadingIndicator.value = false;
    //       HelperMethod.showToast(msg: LocalizationKeys.somethingWentWrong.tr);
    //     },
    //     (r) {
    //       if (r.status == true) {
    //         HelperMethod.showToast(msg: LocalizationKeys.success.tr);
    //         loadingIndicator.value = false;
    //       } else {
    //         HelperMethod.showToast(
    //           msg: LocalizationKeys.somethingWentWrongTryAgain.tr,
    //         );
    //       }
    //     },
    //   );
    // } else {
    //   HelperMethod.showToast(
    //     msg: LocalizationKeys.mustToApproveOnTermsAndCondition.tr,
    //   );
    // }
  }

  AdmissionRequestModel requestModel() {
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
      latestAcademicQualificationFile:
          fileUploadInfo.latestAcademicQualificationFile,
      transcriptFile: fileUploadInfo.transcriptFile,
      contractFile: fileUploadInfo.contractFile,
      cvFile: fileUploadInfo.cvFile,
      rule: fileUploadInfo.rule,
    );
    return requestModel;
  }
}
