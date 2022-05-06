import 'package:boilerplate/features/auth/data/model/response/lookup/lookup_data_response_model.dart';

class LookupResponseModel {
  LookupResponseModel({
    required this.status,
    required this.code,
    required this.data,
  });

  final bool status;
  final int code;
  final List<LookupDataResponseModel> data;

  factory LookupResponseModel.fromJson(Map<String, dynamic> json) =>
      LookupResponseModel(
        status: json["status"],
        code: json["code"],
        data: List<LookupDataResponseModel>.from(
          json["data"].map((x) => LookupDataResponseModel.fromJson(x)),
        ),
      );
}
