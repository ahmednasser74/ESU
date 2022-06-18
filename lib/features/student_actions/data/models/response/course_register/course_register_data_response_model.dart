class CourseRegisterDataResponseModel {
  CourseRegisterDataResponseModel({
    required this.id,
    required this.name,
    required this.hours,
  });

  final int id;
  final String name;
  final int hours;

  factory CourseRegisterDataResponseModel.fromJson(Map<String, dynamic> json) =>
      CourseRegisterDataResponseModel(
        id: json["id"],
        name: json["name"],
        hours: json["hours"],
      );
}
