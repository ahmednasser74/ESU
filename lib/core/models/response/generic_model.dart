class GenericResponseModel {
  GenericResponseModel({
    required this.status,
    required this.code,
    required this.message,
  });

  final bool status;
  final int code;
  final String? message;

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) =>
      GenericResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );
}
