class LookupDataResponseModel {
  LookupDataResponseModel({
    required this.id,
    required this.name,
    required this.nameAr,
    this.code,
    this.shortName,
    this.moodleId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  final int id;
  final String name;
  final String nameAr;
  final int? code;
  final String? shortName;
  final int? moodleId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  factory LookupDataResponseModel.fromJson(Map<String, dynamic> json) =>
      LookupDataResponseModel(
        id: json["id"],
        name: json["name"],
        nameAr: json["name_ar"],
        moodleId: json["moodle_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        code: json["code"],
        shortName: json["short_name"],
      );
}
