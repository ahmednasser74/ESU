import 'package:boilerplate/features/student_actions/data/models/response/tickets/tickets_data_replies_response_model.dart';

class TicketsDataResponseModel {
  TicketsDataResponseModel({
    required this.id,
    required this.subject,
    required this.body,
    required this.attach,
    required this.category,
    required this.status,
    required this.statusName,
    required this.createdAt,
    required this.replies,
  });

  final int id;
  final String subject;
  final String body;
  final String attach;
  final String category;
  final String status;
  final String statusName;
  final String createdAt;
  final List<TicketDataRepliesResponseModel> replies;

  factory TicketsDataResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketsDataResponseModel(
        id: json["id"],
        subject: json["subject"],
        body: json["body"],
        attach: json["attach"],
        category: json["category"],
        status: json["status"],
        statusName: json["status_name"],
        createdAt: json["created_at"],
        replies: List<TicketDataRepliesResponseModel>.from(
          json["replies"]
              .map((x) => TicketDataRepliesResponseModel.fromJson(x)),
        ),
      );

  bool get isStatusClosed => status == 'closed';

  bool get isStatusReply => status == 'reply';
}
