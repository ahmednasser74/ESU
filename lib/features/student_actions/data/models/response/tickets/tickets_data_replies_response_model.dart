class TicketDataRepliesResponseModel {
  TicketDataRepliesResponseModel({
    required this.id,
    required this.by,
    required this.type,
    required this.createdAt,
    required this.file,
  });

  final int id;
  final String by;
  final String type;
  final String createdAt;
  final String file;

  factory TicketDataRepliesResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketDataRepliesResponseModel(
        id: json["id"],
        by: json["by"],
        type: json["type"],
        createdAt: json["created_at"],
        file: json["file"],
      );
}
