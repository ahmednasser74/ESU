class AdmissionResponseModel {
  AdmissionResponseModel({
    required this.status,
    required this.code,
    required this.message,
  });

  final bool status;
  final int code;
  final String message;

  factory AdmissionResponseModel.fromJson(Map<String, dynamic> json) =>
      AdmissionResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );
}
