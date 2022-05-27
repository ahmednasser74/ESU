import 'package:boilerplate/features/student_data/data/models/response/finance/finance_data_response_model.dart';

class FinanceResponseModel {
  FinanceResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final List<FinanceDataResponseModel> data;

  factory FinanceResponseModel.fromJson(Map<String, dynamic> json) =>
      FinanceResponseModel(
        status: json["status"],
        code: json["code"],
        data: List<FinanceDataResponseModel>.from(
          json["data"].map((x) => FinanceDataResponseModel.fromJson(x)),
        ),
      );
}
