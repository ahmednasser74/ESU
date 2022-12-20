// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_progress_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramProgressItemResponseModel _$ProgramProgressItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProgramProgressItemResponseModel(
      completePercentage: json['completed_percent'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProgramProgressItemResponseModelToJson(
        ProgramProgressItemResponseModel instance) =>
    <String, dynamic>{
      'completed_percent': instance.completePercentage,
      'name': instance.name,
    };
