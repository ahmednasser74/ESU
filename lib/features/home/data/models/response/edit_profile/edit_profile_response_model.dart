import 'package:esu/features/auth/data/model/response/login/student_response_model.dart';

class EditProfileResponseModel {
  EditProfileResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool status;
  final int code;
  final String? message;
  final StudentResponseModel data;

  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      EditProfileResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: StudentResponseModel.fromJson(json["data"]),
      );
}
