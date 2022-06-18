import 'package:esu/features/student_data/data/models/response/plans_of_study/course_item_response_model.dart';

class AvailableCoursesResponseModel {
  AvailableCoursesResponseModel({
    required this.status,
    required this.code,
    required this.data,
    this.message,
  });

  final bool status;
  final int code;
  final String? message;
  final List<CourseItemResponseModel> data;

  factory AvailableCoursesResponseModel.fromJson(Map<String, dynamic> json) =>
      AvailableCoursesResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<CourseItemResponseModel>.from(
          json["data"].map((x) => CourseItemResponseModel.fromJson(x)),
        ),
      );
}
