import 'package:esu/features/student_data/data/models/response/attendance/attendance_item_details_response_model.dart';

class AttendanceItemResponseModel {
  AttendanceItemResponseModel({
    required this.course,
    required this.moodleCourse,
    required this.total,
    required this.finished,
    required this.abcense,
    required this.status,
    required this.details,
  });

  final String course;
  final String moodleCourse;
  final int total;
  final int finished;
  final int abcense;
  final String status;
  final List<AttendanceItemDetailsResponseModel> details;

  factory AttendanceItemResponseModel.fromJson(Map<String, dynamic> json) => AttendanceItemResponseModel(
        course: json["course"],
        moodleCourse: json["moodle_course"],
        total: json["total"],
        finished: json["finished"],
        abcense: json["abcense"],
        status: json["status"],
        details: List<AttendanceItemDetailsResponseModel>.from(
          json["details"].map((x) => AttendanceItemDetailsResponseModel.fromJson(x)),
        ),
      );
}
