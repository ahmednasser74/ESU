class ForgetPasswordResponseModel {
  ForgetPasswordResponseModel({
    required this.status,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final bool status;
  final int statusCode;
  final String message;
  final ForgetPasswordDataResponseModel data;

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordResponseModel(
        status: json["status"],
        statusCode: json["code"],
        message: json["message"],
        data: ForgetPasswordDataResponseModel.fromJson(
          json["student"],
        ),
      );
}

class ForgetPasswordDataResponseModel {
  final String code;

  ForgetPasswordDataResponseModel({
    required this.code,
  });

  factory ForgetPasswordDataResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordDataResponseModel(
        code: json["code"],
      );
}
