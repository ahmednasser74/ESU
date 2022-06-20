class TranscriptItemResponseModel {
  TranscriptItemResponseModel({
    required this.name,
    required this.id,
  });

  final String name;
  final int id;

  factory TranscriptItemResponseModel.fromJson(Map<String, dynamic> json) =>
      TranscriptItemResponseModel(
        name: json['name'],
        id: json['id'],
      );
}
