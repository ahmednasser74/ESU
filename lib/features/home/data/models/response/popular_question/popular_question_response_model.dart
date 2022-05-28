import 'package:boilerplate/features/home/data/models/response/popular_question/popular_question_item_response_model.dart';

class PopularQuestionResponseModel {
  PopularQuestionResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final String status;
  final String message;
  final PopularQuestionItemResponseModel data;

  factory PopularQuestionResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularQuestionResponseModel(
        status: json["status"],
        message: json["message"],
        data: PopularQuestionItemResponseModel.fromJson(json["data"]),
      );
}
