import 'package:boilerplate/features/auth/data/model/response/login/login_data_response_model.dart';

class LoginResponseModel {
  LoginResponseModel({
    required this.status,
    required this.code,
    this.data,
    this.message,
  });

  final bool status;
  final int code;
  final String? message;
  final LoginDataResponseModel? data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] != null
            ? LoginDataResponseModel.fromJson(json["data"])
            : null,
      );
}
