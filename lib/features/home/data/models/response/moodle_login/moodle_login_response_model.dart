import 'package:json_annotation/json_annotation.dart';

import 'moodle_login_data_response_model.dart';

part 'moodle_login_response_model.g.dart';

@JsonSerializable(createToJson: false)
class MoodleLoginResponseModel {
  MoodleLoginResponseModel();

  bool? status;
  int? code;
  String? message;
  late final MoodleLoginDataResponseModel? data;

  factory MoodleLoginResponseModel.fromJson(Map<String, dynamic> json) => _$MoodleLoginResponseModelFromJson(json);
}
