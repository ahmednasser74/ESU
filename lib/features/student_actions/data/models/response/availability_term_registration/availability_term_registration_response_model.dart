import 'availability_term_registration_data_response_model.dart';

class AvailabilityTermRegistrationResponseModel {
  AvailabilityTermRegistrationResponseModel({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  final bool status;
  final int code;
  final String message;
  final AvailabilityTermRegistrationDataResponseModel? data;

  factory AvailabilityTermRegistrationResponseModel.fromJson(
          Map<String, dynamic> json) =>
      AvailabilityTermRegistrationResponseModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : AvailabilityTermRegistrationDataResponseModel.fromJson(
                json["data"],
              ),
      );
}
