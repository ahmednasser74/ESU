import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/auth/data/model/response/login/student_response_model.dart';

class LoginDataResponseModel {
  LoginDataResponseModel({
    required this.token,
    required this.student,
  });

  final String token;
  final StudentResponseModel student;

  factory LoginDataResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginDataResponseModel(
        token: json["token"] ?? SharedPrefs.instance.getToken(),
        student: StudentResponseModel.fromJson(
          json["student"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "student": student.toJson(),
      };
}
