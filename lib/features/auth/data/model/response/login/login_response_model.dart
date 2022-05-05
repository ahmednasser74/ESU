import 'package:boilerplate/features/auth/data/model/response/login/login_data_response_model.dart';

class LoginResponseModel {
  LoginResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final LoginDataResponseModel data;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        status: json["status"],
        code: json["code"],
        data: LoginDataResponseModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
      };
}
