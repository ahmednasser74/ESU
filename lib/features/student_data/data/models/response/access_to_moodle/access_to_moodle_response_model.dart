class AccessToMoodleResponseModel {
  AccessToMoodleResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final AccessToMoodleDataResponseModel data;

  factory AccessToMoodleResponseModel.fromJson(Map<String, dynamic> json) =>
      AccessToMoodleResponseModel(
        status: json["status"],
        code: json["code"],
        data: AccessToMoodleDataResponseModel.fromJson(json["data"]),
      );
}

class AccessToMoodleDataResponseModel {
  AccessToMoodleDataResponseModel({
    required this.files,
    required this.videos,
    required this.link,
  });

  final List<String> files;
  final List<String> videos;
  final String link;

  factory AccessToMoodleDataResponseModel.fromJson(Map<String, dynamic> json) =>
      AccessToMoodleDataResponseModel(
        files: List<String>.from(json["files"].map((x) => x)),
        videos: List<String>.from(json["videos"].map((x) => x)),
        link: json["link"],
      );
}
