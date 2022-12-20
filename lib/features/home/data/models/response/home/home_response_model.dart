import 'package:esu/features/home/data/models/response/home/home_data/home_data_response_model.dart';

class HomeResponseModel {
  HomeResponseModel({
    required this.status,
    required this.code,
    required this.data,
    this.message,
  });

  final bool status;
  final int code;
  final HomeDataResponseModel? data;
  final String? message;

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : HomeDataResponseModel.fromJson(json["data"]),
      );
}
