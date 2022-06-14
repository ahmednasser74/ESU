import 'package:boilerplate/features/student_actions/data/models/response/tickets/tickets_data_replies_response_model.dart';

class TicketDetailsDataResponseModel {
  TicketDetailsDataResponseModel({
    required this.id,
    required this.subject,
    required this.body,
    this.attach,
    required this.category,
    required this.status,
    required this.createdAt,
    required this.replies,
  });

  final int id;
  final String subject;
  final String body;
  final String? attach;
  final String category;
  final String status;
  final String createdAt;
  final List<TicketDataRepliesResponseModel> replies;

  factory TicketDetailsDataResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketDetailsDataResponseModel(
        id: json["id"],
        subject: json["subject"],
        body: json["body"],
        attach: json["attach"],
        category: json["category"],
        status: json["status"],
        createdAt: json["created_at"],
        replies: List<TicketDataRepliesResponseModel>.from(
          json["replies"].map(
            (x) => TicketDataRepliesResponseModel.fromJson(x),
          ),
        ),
      );
}
