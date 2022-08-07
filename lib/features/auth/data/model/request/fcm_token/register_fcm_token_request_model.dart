class FcmTokenRequestModel {
  FcmTokenRequestModel({
    required this.fcmToken,
    this.type,
  });

  final String fcmToken;
  final String? type;

  Map<String, dynamic> toJson() => {
        "fcm_token": fcmToken,
        "type": type,
      };
}
