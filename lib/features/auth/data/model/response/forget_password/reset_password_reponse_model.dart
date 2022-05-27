class ResetPasswordResponseModel {
  ResetPasswordResponseModel({
    required this.status,
    required this.code,
    required this.message,
  });

  final bool status;
  final int code;
  final String message;

  factory ResetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );
}
