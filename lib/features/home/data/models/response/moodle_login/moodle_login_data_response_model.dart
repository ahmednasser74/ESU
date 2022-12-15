import 'package:json_annotation/json_annotation.dart';

part 'moodle_login_data_response_model.g.dart';

@JsonSerializable(createToJson: false)
class MoodleLoginDataResponseModel {
  MoodleLoginDataResponseModel();

  late final String url;

  factory MoodleLoginDataResponseModel.fromJson(Map<String, dynamic> json) => _$MoodleLoginDataResponseModelFromJson(json);
}
