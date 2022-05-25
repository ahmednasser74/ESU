import 'package:boilerplate/features/student_data/data/models/response/letters/letters_data_response_model.dart';

class LettersResponseModel {
  LettersResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final List<LettersDataResponseModel> data;

  factory LettersResponseModel.fromJson(Map<String, dynamic> json) =>
      LettersResponseModel(
        status: json["status"],
        code: json["code"],
        data: List<LettersDataResponseModel>.from(
          json["data"].map((x) => LettersDataResponseModel.fromJson(x)),
        ),
      );
}
