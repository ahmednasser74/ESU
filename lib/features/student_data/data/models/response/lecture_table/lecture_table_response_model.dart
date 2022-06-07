import 'package:boilerplate/features/student_data/data/models/response/lecture_table/lecture_table_data_response_model.dart';

class LectureTableResponseModel {
  LectureTableResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool status;
  final int code;
  final String? message;
  final LectureTableDataResponseModel? data;

  factory LectureTableResponseModel.fromJson(Map<String, dynamic> json) =>
      LectureTableResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : LectureTableDataResponseModel.fromJson(json["data"]),
      );
}
