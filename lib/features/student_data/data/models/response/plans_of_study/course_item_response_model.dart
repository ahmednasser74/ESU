class CourseItemResponseModel {
  CourseItemResponseModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.hours,
    required this.code,
    required this.prerequisite,
  });

  final int id;
  final String name;
  final String nameAr;
  final int hours;
  final String code;
  List<Prerequisite> prerequisite;

  factory CourseItemResponseModel.fromJson(Map<String, dynamic> json) =>
      CourseItemResponseModel(
        id: json["id"],
        name: json["name"],
        nameAr: json["name_ar"],
        hours: json["hours"],
        code: json["code"],
        prerequisite: List<Prerequisite>.from(
          json["prerequisites"].map((x) => Prerequisite.fromJson(x)),
        ),
      );
}

class Prerequisite {
  Prerequisite({
    required this.name,
    required this.nameAr,
    required this.pivot,
  });

  final String name;
  final String nameAr;
  final Pivot pivot;

  factory Prerequisite.fromJson(Map<String, dynamic> json) => Prerequisite(
        name: json["name"],
        nameAr: json["name_ar"],
        pivot: Pivot.fromJson(json["pivot"]),
      );
}

class Pivot {
  Pivot({
    required this.courseId,
    required this.requestCourseId,
  });

  final int courseId;
  final int requestCourseId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        courseId: json["course_id"],
        requestCourseId: json["request_course_id"],
      );
}
