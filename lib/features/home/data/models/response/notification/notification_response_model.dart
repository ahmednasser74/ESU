class NotificationItemResponseModel {
  NotificationItemResponseModel({
    required this.id,
    required this.title,
    required this.body,
    required this.status,
  });

  final int id;
  final String title;
  final String body;
  final String status;

  factory NotificationItemResponseModel.fromJson(Map<String, dynamic> json) =>
      NotificationItemResponseModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        status: json["status"],
      );
}
