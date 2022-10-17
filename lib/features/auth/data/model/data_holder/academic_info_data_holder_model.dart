class AcademicInformationDataHolderModel {
  String currentCertificate;
  int programId;

  AcademicInformationDataHolderModel({
    required this.currentCertificate,
    required this.programId,
  });

  Map<String, dynamic> toJson() => {
        'currentCertificate': currentCertificate,
        'programId': programId,
      };

  factory AcademicInformationDataHolderModel.fromJson(Map<String, dynamic> json) {
    return AcademicInformationDataHolderModel(
      currentCertificate: json['currentCertificate'],
      programId: json['programId'],
    );
  }
}
