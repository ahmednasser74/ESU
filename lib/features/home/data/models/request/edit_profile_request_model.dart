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
  final File? photo;
  final String? facebook;
  final String? twitter;
  final String? instagram;
  final String? linkedin;
  final String? whatsapp;
  final String? whatsapp2;
  final String? whatsapp3;
  final String? whatsappPin;
  final bool? isAgreeToPublishPersonalInfo;

  EditProfileRequestModel({
    this.nationalPassportFile,
    this.latestAcademicQualificationFile,
    this.transcriptFile,
    this.contractFile,
    this.cvFile,
    this.password,
    this.passwordConfirmation,
    this.photo,
    this.facebook,
    this.twitter,
    this.instagram,
    this.linkedin,
    this.whatsapp,
    this.whatsapp2,
    this.whatsapp3,
    this.whatsappPin,
    this.isAgreeToPublishPersonalInfo,
  });

  Future<Map<String, dynamic>> toJson() async => {
        'password': password,
        'password_confirmation': passwordConfirmation,
        'f[national_passport_file]': nationalPassportFile == null ? null : await MultipartFile.fromFile(nationalPassportFile!.path),
        'f[latest_academic_qualification_file]': latestAcademicQualificationFile == null
            ? null
            : await MultipartFile.fromFile(
                latestAcademicQualificationFile!.path,
              ),
        'f[transcript_file]': transcriptFile == null ? null : await MultipartFile.fromFile(transcriptFile!.path),
        'f[contract_file]': contractFile == null ? null : await MultipartFile.fromFile(contractFile!.path),
        'f[cv]': cvFile == null ? null : await MultipartFile.fromFile(cvFile!.path),
        'photo': photo == null ? null : await MultipartFile.fromFile(photo!.path),
        'facebook': facebook,
        'instagram': instagram,
        'twitter': twitter,
        'linkedin': linkedin,
        'whats_number': whatsapp,
        'optional_whats_numbers[0]': whatsapp2,
        'optional_whats_numbers[1]': whatsapp3,
        'whatsapp_pin': whatsappPin,
        'publish_social_profile': isAgreeToPublishPersonalInfo ?? false,
      };
}
