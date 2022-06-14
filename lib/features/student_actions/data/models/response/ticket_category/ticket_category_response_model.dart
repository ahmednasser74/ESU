class TicketsCategoriesDataResponseModel {
  TicketsCategoriesDataResponseModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory TicketsCategoriesDataResponseModel.fromJson(
          Map<String, dynamic> json) =>
      TicketsCategoriesDataResponseModel(
        id: json["id"],
        name: json["name"],
      );
}
