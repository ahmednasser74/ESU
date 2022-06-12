class TermRegisterPayResponseModel {
  TermRegisterPayResponseModel({
    required this.status,
    required this.code,
    this.message,
    this.paymentUrl,
  });

  final bool status;
  final int code;
  final String? message;
  final String? paymentUrl;

  factory TermRegisterPayResponseModel.fromJson(Map<String, dynamic> json) =>
      TermRegisterPayResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        paymentUrl: json["payment_url"],
      );
}
