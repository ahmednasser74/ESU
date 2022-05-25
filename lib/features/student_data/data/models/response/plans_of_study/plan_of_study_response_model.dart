import 'package:boilerplate/features/student_data/data/models/response/plans_of_study/plans_of_study_data_response_model.dart';

class StudyPlansResponseModel {
  StudyPlansResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final StudyPlansDataResponseModel data;

  factory StudyPlansResponseModel.fromJson(Map<String, dynamic> json) =>
      StudyPlansResponseModel(
        status: json["status"],
        code: json["code"],
        data: StudyPlansDataResponseModel.fromJson(json["data"]),
      );
}
