import 'package:esu/core/const/list_const.dart';

class AcademicInformationDataHolderModel {
  CertificateType currentCertificate;
  String? programName;
  int programId;

  AcademicInformationDataHolderModel({
    required this.currentCertificate,
    required this.programId,
    this.programName,
  });

  Map<String, dynamic> toJson() => {
        'currentCertificate': currentCertificate.value,
        'programId': programId,
      };

  factory AcademicInformationDataHolderModel.fromJson(Map<String, dynamic> json) {
    return AcademicInformationDataHolderModel(
      currentCertificate: parseCertificate(json['currentCertificate']),
      programId: json['programId'],
    );
  }
}
