import 'tickets_details_data_response_model.dart';

class TicketDetailsResponseModel {
  TicketDetailsResponseModel({
    required this.status,
    required this.code,
    this.message,
    required this.data,
  });

  final bool status;
  final int code;
  final String? message;
  final TicketDetailsDataResponseModel? data;

  factory TicketDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketDetailsResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] != null || json["data"] == []
            ? TicketDetailsDataResponseModel.fromJson(json["data"])
            : null,
      );
}
