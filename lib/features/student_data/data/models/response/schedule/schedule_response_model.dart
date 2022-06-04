class ScheduleResponseModel {
  ScheduleResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final List<String> data;

  factory ScheduleResponseModel.fromJson(Map<String, dynamic> json) =>
      ScheduleResponseModel(
        status: json["status"],
        code: json["code"],
        data: List<String>.from(json["data"].map((x) => x)),
      );
}
