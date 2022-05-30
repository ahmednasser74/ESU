class CheckEditProfileFilesDataResponseModel {
  CheckEditProfileFilesDataResponseModel({
    this.nationalPassportFile = false,
    this.latestAcademicQualificationFile = false,
    this.transcriptFile = false,
    this.contractFile = false,
    this.cv = false,
  });

  final bool nationalPassportFile;
  final bool latestAcademicQualificationFile;
  final bool transcriptFile;
  final bool contractFile;
  final bool cv;

  factory CheckEditProfileFilesDataResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CheckEditProfileFilesDataResponseModel(
        nationalPassportFile:
            json['national_passport_file'] == null ? false : true,
        latestAcademicQualificationFile:
            json['latest_academic_qualification_file'] == null ? false : true,
        transcriptFile: json['transcript_file'] == null ? false : true,
        contractFile: json['contract_file'] == null ? false : true,
        cv: json['cv'] == null ? false : true,
      );
}
