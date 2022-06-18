import 'package:esu/features/student_actions/data/models/response/tickets/tickets_data_response_model.dart';

class TicketsResponseModel {
  TicketsResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool status;
  final int code;
  final String? message;
  final List<TicketsDataResponseModel> data;

  factory TicketsResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketsResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<TicketsDataResponseModel>.from(
          json["data"].map((x) => TicketsDataResponseModel.fromJson(x)),
        ),
      );
}
