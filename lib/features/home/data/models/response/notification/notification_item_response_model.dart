import 'notification_response_model.dart';

class NotificationResponseModel {
  NotificationResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final List<NotificationItemResponseModel> data;

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      NotificationResponseModel(
        status: json["status"],
        code: json["code"],
        data: List<NotificationItemResponseModel>.from(
          json["data"].map(
            (x) => NotificationItemResponseModel.fromJson(x),
          ),
        ),
      );
}
