import 'package:boilerplate/features/student_data/data/models/response/lecture_table/lecture_table_data_response_model.dart';

class LectureTableResponseModel {
  LectureTableResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final LectureTableDataResponseModel data;

  factory LectureTableResponseModel.fromJson(Map<String, dynamic> json) =>
      LectureTableResponseModel(
        status: json["status"],
        code: json["code"],
        data: LectureTableDataResponseModel.fromJson(json["data"]),
      );
}
