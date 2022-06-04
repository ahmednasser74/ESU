import 'package:boilerplate/features/student_data/data/models/response/lecture_table/lecture_table_course_response_model.dart';

class LectureTableDataResponseModel {
  LectureTableDataResponseModel({
    required this.generalNote,
    required this.courses,
  });

  final String generalNote;
  final List<LectureTableCourseResponseModel> courses;

  factory LectureTableDataResponseModel.fromJson(Map<String, dynamic> json) =>
      LectureTableDataResponseModel(
        generalNote: json["general_note"],
        courses: List<LectureTableCourseResponseModel>.from(
          json["courses"].map(
            (x) => LectureTableCourseResponseModel.fromJson(x),
          ),
        ),
      );
}
