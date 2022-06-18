import 'package:esu/features/student_data/data/models/response/plans_of_study/program_data_response_model.dart';

class StudyPlansDataResponseModel {
  StudyPlansDataResponseModel({
    required this.programName,
    required this.programData,
  });

  final String programName;
  final List<ProgramDataResponseModel> programData;

  factory StudyPlansDataResponseModel.fromJson(Map<String, dynamic> json) =>
      StudyPlansDataResponseModel(
        programName: json["program"],
        programData: List<ProgramDataResponseModel>.from(
          json["program_data"].map((x) => ProgramDataResponseModel.fromJson(x)),
        ),
      );
}
