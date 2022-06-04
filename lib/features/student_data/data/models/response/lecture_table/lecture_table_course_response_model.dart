class LectureTableCourseResponseModel {
  LectureTableCourseResponseModel({
    required this.doctorName,
    required this.courseName,
    required this.courseCode,
    required this.weeklyLecture,
    required this.note,
  });

  final String doctorName;
  final String courseName;
  final String courseCode;
  final String weeklyLecture;
  final String? note;

  factory LectureTableCourseResponseModel.fromJson(Map<String, dynamic> json) =>
      LectureTableCourseResponseModel(
        doctorName: json["doctor_name"],
        courseName: json["course_name"],
        courseCode: json["course_code"],
        weeklyLecture: json["weekly_lecture"],
        note: json["note"],
      );
}
