import 'course_item_response_model.dart';

class ProgramDataResponseModel {
  ProgramDataResponseModel({
    required this.name,
    required this.courses,
  });

  final String name;
  final List<CourseItemResponseModel> courses;

  factory ProgramDataResponseModel.fromJson(Map<String, dynamic> json) =>
      ProgramDataResponseModel(
        name: json["name"],
        courses: List<CourseItemResponseModel>.from(
          json["courses"].map((x) => CourseItemResponseModel.fromJson(x)),
        ),
      );
}
