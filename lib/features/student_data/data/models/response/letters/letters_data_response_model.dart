class LettersDataResponseModel {
  LettersDataResponseModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
  });

  final int id;
  final String titleEn;
  final String titleAr;

  factory LettersDataResponseModel.fromJson(Map<String, dynamic> json) =>
      LettersDataResponseModel(
        id: json["id"],
        titleEn: json["title_en"],
        titleAr: json["title_ar"],
      );
}
