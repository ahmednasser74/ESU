import 'attendance_item_response_model.dart';

class AttendanceResponseModel {
  AttendanceResponseModel({
    required this.status,
    required this.code,
    required this.data,
    this.message,
  });

  final bool status;
  final int code;
  final String? message;
  final List<AttendanceItemResponseModel> data;

  factory AttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      AttendanceResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<AttendanceItemResponseModel>.from(
                json["data"]
                    .map((x) => AttendanceItemResponseModel.fromJson(x)),
              ),
      );
}
