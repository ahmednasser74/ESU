// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moodle_login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodleLoginResponseModel _$MoodleLoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    MoodleLoginResponseModel()
      ..status = json['status'] as bool?
      ..code = json['code'] as int?
      ..message = json['message'] as String?
      ..data = json['data'] == null
          ? null
          : MoodleLoginDataResponseModel.fromJson(
              json['data'] as Map<String, dynamic>);
