import 'package:esu/features/home/data/models/response/popular_question/popular_question_response_model.dart';

class PopularQuestionResponseModel {
  PopularQuestionResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final List<PopularQuestionDataResponseModel> data;

  factory PopularQuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularQuestionResponseModel(
        status: json["status"],
        code: json["code"],
        data: List<PopularQuestionDataResponseModel>.from(
          json["data"].map((x) => PopularQuestionDataResponseModel.fromJson(x)),
        ),
      );
}
