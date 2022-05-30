import 'dart:io';

import 'package:dio/dio.dart';

class EditProfileRequestModel {
  final File? nationalPassportFile;
  final File? latestAcademicQualificationFile;
  final File? transcriptFile;
  final File? contractFile;
  final File? cvFile;
  final String? password;
  final String? passwordConfirmation;

  EditProfileRequestModel({
    this.nationalPassportFile,
    this.latestAcademicQualificationFile,
    this.transcriptFile,
    this.contractFile,
    this.cvFile,
    this.password,
    this.passwordConfirmation,
  });

  Future<Map<String, dynamic>> toJson() async => {
        'password': password,
        'password_confirmation': passwordConfirmation,
        'f[national_passport_file]': nationalPassportFile == null
            ? null
            : await MultipartFile.fromFile(nationalPassportFile!.path),
        'f[latest_academic_qualification_file]':
            latestAcademicQualificationFile == null
                ? null
                : await MultipartFile.fromFile(
                    latestAcademicQualificationFile!.path,
                  ),
        'f[transcript_file]': transcriptFile == null
            ? null
            : await MultipartFile.fromFile(transcriptFile!.path),
        'f[contract_file]': contractFile == null
            ? null
            : await MultipartFile.fromFile(contractFile!.path),
        'f[cv]':
            cvFile == null ? null : await MultipartFile.fromFile(cvFile!.path),
      };
}
