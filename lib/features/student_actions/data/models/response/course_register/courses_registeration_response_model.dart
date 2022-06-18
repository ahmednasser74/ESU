import 'course_register_data_response_model.dart';

class CourseRegisterResponseModel {
  CourseRegisterResponseModel({
    required this.status,
    required this.code,
    required this.data,
    this.message,
  });

  final bool status;
  final int code;
  final String? message;
  final List<CourseRegisterDataResponseModel>? data;

  factory CourseRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      CourseRegisterResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : List<CourseRegisterDataResponseModel>.from(
                json["data"]
                    .map((x) => CourseRegisterDataResponseModel.fromJson(x)),
              ),
      );
}
