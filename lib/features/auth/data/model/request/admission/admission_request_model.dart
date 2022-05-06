import 'dart:io';

import 'package:dio/dio.dart';

class AdmissionRequestModel {
  final String currentCertificate;
  final int programId;
  final String email;
  final String firstNameEnglish;
  final String lastNameEnglish;
  final String secondNameEnglish;
  final String firstNameArabic;
  final String secondNameArabic;
  final String lastNameArabic;
  final String nationalPassport;
  final String mobileNumber;
  final String birthDate;
  final String gender;
  final int countryId;
  final int nationalityId;
  final String? yourJob;
  final String? yourCompany;
  final String currentAddress;
  final File nationalPassportFile;
  final File latestAcademicQualificationFile;
  final File transcriptFile;
  final File contractFile;
  final File? cvFile;
  final int rule;

  AdmissionRequestModel({
    required this.currentCertificate,
    required this.programId,
    required this.email,
    required this.firstNameEnglish,
    required this.lastNameEnglish,
    required this.secondNameEnglish,
    required this.firstNameArabic,
    required this.secondNameArabic,
    required this.lastNameArabic,
    required this.nationalPassport,
    required this.mobileNumber,
    required this.birthDate,
    required this.gender,
    required this.countryId,
    required this.nationalityId,
    this.yourJob,
    this.yourCompany,
    required this.currentAddress,
    required this.nationalPassportFile,
    required this.latestAcademicQualificationFile,
    required this.transcriptFile,
    required this.contractFile,
    this.cvFile,
    required this.rule,
  });

  Future<Map<String, dynamic>> toJson() async => {
        'current_certificate': currentCertificate,
        'program_id': programId,
        'email': email,
        'f[first_name_en]': firstNameEnglish,
        'f[second_name_en]': secondNameEnglish,
        'f[last_name_en]': lastNameEnglish,
        'f[first_name_ar]': firstNameArabic,
        'f[second_name_ar]': secondNameArabic,
        'f[last_name_ar]': lastNameArabic,
        'national_passport': nationalPassport,
        'mobile': mobileNumber,
        'f[date_of_birth]': birthDate,
        'gender': gender,
        'country_id': countryId,
        'nationality_id': nationalityId,
        'f[your_job]': yourJob,
        'f[your_company]': yourCompany,
        'f[current_address]': currentAddress,
        'f[national_passport_file]': await MultipartFile.fromFile(
          nationalPassportFile.path,
        ),
        'f[latest_academic_qualification_file]': await MultipartFile.fromFile(
          latestAcademicQualificationFile.path,
        ),
        'f[transcript_file]': await MultipartFile.fromFile(
          transcriptFile.path,
        ),
        'f[contract_file]': await MultipartFile.fromFile(
          contractFile.path,
        ),
        'f[cv]': cvFile == null
            ? null
            : await MultipartFile.fromFile(
                cvFile!.path,
              ),
        'rule': rule,
      };
}
