class NotificationDataModel {
  NotificationDataModel({this.route});

  final String? route;

  factory NotificationDataModel.fromJsom(Map<String, dynamic> json) => NotificationDataModel(
        route: json['route'],
      );
}
