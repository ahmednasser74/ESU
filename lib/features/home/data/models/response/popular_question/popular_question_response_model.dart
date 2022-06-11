class PopularQuestionDataResponseModel {
  PopularQuestionDataResponseModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  final int id;
  final String question;
  final String answer;

  factory PopularQuestionDataResponseModel.fromJson(
          Map<String, dynamic> json) =>
      PopularQuestionDataResponseModel(
        id: json["id"],
        question: json["question"],
        answer: json["answer"],
      );
}
