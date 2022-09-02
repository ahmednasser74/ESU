class FinancePayUrlResponseModel {
  FinancePayUrlResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final FinancePayDataResponseModel data;

  factory FinancePayUrlResponseModel.fromJson(Map<String, dynamic> json) =>
      FinancePayUrlResponseModel(
        status: json["status"],
        code: json["code"],
        data: FinancePayDataResponseModel.fromJson(json['data']),
      );
}

class FinancePayDataResponseModel {
  FinancePayDataResponseModel({
    required this.url,
  });

  final String url;

  factory FinancePayDataResponseModel.fromJson(Map<String, dynamic> json) =>
      FinancePayDataResponseModel(
        url: json['url'],
      );
}
