import 'dart:io';

class FileUploadDataHolder {
  final File nationalPassportFile;
  final File latestAcademicQualificationFile;
  final File transcriptFile;
  final File contractFile;
  final File? cvFile;
  final int rule;

  FileUploadDataHolder({
    required this.nationalPassportFile,
    required this.latestAcademicQualificationFile,
    required this.transcriptFile,
    required this.contractFile,
    required this.rule,
    this.cvFile,
  });
}
