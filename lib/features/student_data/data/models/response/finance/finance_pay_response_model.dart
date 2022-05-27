class FinancePayUrlResponseModel {
  FinancePayUrlResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final FinancePayDateResponseModel data;

  factory FinancePayUrlResponseModel.fromJson(Map<String, dynamic> json) =>
      FinancePayUrlResponseModel(
        status: json["status"],
        code: json["code"],
        data: FinancePayDateResponseModel.fromJson(json['data']),
      );
}

class FinancePayDateResponseModel {
  FinancePayDateResponseModel({
    required this.url,
  });

  final String url;

  factory FinancePayDateResponseModel.fromJson(Map<String, dynamic> json) =>
      FinancePayDateResponseModel(
        url: json['url'],
      );
}
