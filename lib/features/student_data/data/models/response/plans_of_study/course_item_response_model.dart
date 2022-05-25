class CourseItemResponseModel {
  CourseItemResponseModel({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.hours,
    required this.code,
  });

  final int id;
  final String name;
  final String nameAr;
  final int hours;
  final String code;

  factory CourseItemResponseModel.fromJson(Map<String, dynamic> json) =>
      CourseItemResponseModel(
        id: json["id"],
        name: json["name"],
        nameAr: json["name_ar"],
        hours: json["hours"],
        code: json["code"],
      );
}
