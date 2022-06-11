class TermRegisterPayResponseModel {
  TermRegisterPayResponseModel({
    required this.status,
    required this.code,
    required this.message,
  });

  final bool status;
  final int code;
  final String message;

  factory TermRegisterPayResponseModel.fromJson(Map<String, dynamic> json) =>
      TermRegisterPayResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
      );
}
