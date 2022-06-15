class TicketDataRepliesResponseModel {
  TicketDataRepliesResponseModel({
    required this.id,
    required this.by,
    required this.type,
    required this.createdAt,
    this.file,
    required this.body,
  });

  final int id;
  final String by;
  final String type;
  final String createdAt;
  final String? file;
  final String body;

  factory TicketDataRepliesResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketDataRepliesResponseModel(
        id: json["id"],
        by: json["by"],
        type: json["type"],
        createdAt: json["created_at"],
        file: json["file"],
        body: json["body"],
      );

  bool get isReplyFromStudent =>
      type.contains('Student') || type.contains('طالب');
}
