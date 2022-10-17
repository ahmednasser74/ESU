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

  Map<String, dynamic> toJson() => {
        'nationalPassportFile': nationalPassportFile.path,
        'latestAcademicQualificationFile': latestAcademicQualificationFile.path,
        'transcriptFile': transcriptFile.path,
        'contractFile': contractFile.path,
        'cvFile': cvFile?.path,
        'rule': rule,
      };

  factory FileUploadDataHolder.fromJson(Map<String, dynamic> json) {
    return FileUploadDataHolder(
      nationalPassportFile: File(json['nationalPassportFile']),
      latestAcademicQualificationFile: File(json['latestAcademicQualificationFile']),
      transcriptFile: File(json['transcriptFile']),
      contractFile: File(json['contractFile']),
      cvFile: json['cvFile'] == null ? null : File(json['cvFile']),
      rule: json['rule'],
    );
  }
}
