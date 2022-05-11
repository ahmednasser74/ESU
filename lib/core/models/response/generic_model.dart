class GenericResponseModel {
  GenericResponseModel({
    required this.status,
    required this.code,
  });

  final bool status;
  final int code;

  factory GenericResponseModel.fromJson(Map<String, dynamic> json) =>
      GenericResponseModel(
        status: json["status"],
        code: json["code"],
      );
}
