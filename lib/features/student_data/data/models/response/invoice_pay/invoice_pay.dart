class InvoicePayResponseModel {
  InvoicePayResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final InvoicePayDataResponseModel data;

  factory InvoicePayResponseModel.fromJson(Map<String, dynamic> json) =>
      InvoicePayResponseModel(
        status: json["status"],
        code: json["code"],
        data: InvoicePayDataResponseModel.fromJson(json["data"]),
      );
}

class InvoicePayDataResponseModel {
  InvoicePayDataResponseModel({
    required this.url,
  });

  final String url;

  factory InvoicePayDataResponseModel.fromJson(Map<String, dynamic> json) =>
      InvoicePayDataResponseModel(
        url: json["url"],
      );
}
