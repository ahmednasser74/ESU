class PopularQuestionItemResponseModel {
  PopularQuestionItemResponseModel({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  factory PopularQuestionItemResponseModel.fromJson(
          Map<String, dynamic> json) =>
      PopularQuestionItemResponseModel(
        question: json["question"],
        answer: json["answer"],
      );
}
