import 'package:boilerplate/features/home/data/models/response/chec_profile_files/check_edit_profile_files_data_response_model.dart';

class CheckEditProfileFilesResponseModel {
  final bool status;
  final int code;
  final String? message;
  final CheckEditProfileFilesDataResponseModel? data;

  CheckEditProfileFilesResponseModel({
    required this.status,
    required this.code,
    this.data,
    this.message,
  });

  factory CheckEditProfileFilesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      CheckEditProfileFilesResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : CheckEditProfileFilesDataResponseModel.fromJson(json["data"]),
      );
}
