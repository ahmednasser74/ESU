import 'ticket_category_response_model.dart';

class TicketsCategoriesResponseModel {
  TicketsCategoriesResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final List<TicketsCategoriesDataResponseModel> data;

  factory TicketsCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketsCategoriesResponseModel(
        status: json["status"],
        code: json["code"],
        data: List<TicketsCategoriesDataResponseModel>.from(
          json["data"].map(
            (x) => TicketsCategoriesDataResponseModel.fromJson(x),
          ),
        ),
      );
}
