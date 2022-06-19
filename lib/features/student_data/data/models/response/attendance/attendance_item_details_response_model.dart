class AttendanceItemDetailsResponseModel {
  AttendanceItemDetailsResponseModel({
    required this.id,
    required this.name,
    required this.openTime,
    required this.timeClose,
    required this.isFinished,
  });

  final int id;
  final String name;
  final String openTime;
  final String timeClose;
  final int isFinished;

  factory AttendanceItemDetailsResponseModel.fromJson(Map<String, dynamic> json) => AttendanceItemDetailsResponseModel(
        id: json["id"],
        name: json["name"],
        openTime: json["open_time"],
        timeClose: json["time_close"],
        isFinished: json["is_finished"],
      );
}
