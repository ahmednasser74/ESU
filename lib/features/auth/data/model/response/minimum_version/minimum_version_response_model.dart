class MinimumVersionResponseModel {
  MinimumVersionResponseModel({
    required this.status,
    required this.code,
    this.message,
    required this.minVersion,
  });

  final bool status;
  final int code;
  final String? message;
  final String minVersion;

  factory MinimumVersionResponseModel.fromJson(Map<String, dynamic> json) => MinimumVersionResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        minVersion: json["data"]['min_version'],
      );
}
