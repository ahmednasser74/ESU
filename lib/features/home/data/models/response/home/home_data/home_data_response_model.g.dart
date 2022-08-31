// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDataResponseModel _$HomeDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    HomeDataResponseModel()
      ..program = json['program'] as String
      ..photo = json['photo'] as String
      ..name = json['name'] as String
      ..profileRedirect = json['profile_redirect'] as bool
      ..invoiceRedirect = json['invoices_redirect'] as bool
      ..programProgress = (json['programs_progress'] as List<dynamic>)
          .map((e) => ProgramProgressItemResponseModel.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..knowledgePointsAverage = json['Knowledge_points_avg'] as int
      ..gpa = (json['gpa'] as num).toDouble();

Map<String, dynamic> _$HomeDataResponseModelToJson(
        HomeDataResponseModel instance) =>
    <String, dynamic>{
      'program': instance.program,
      'photo': instance.photo,
      'name': instance.name,
      'profile_redirect': instance.profileRedirect,
      'invoices_redirect': instance.invoiceRedirect,
      'programs_progress': instance.programProgress,
      'Knowledge_points_avg': instance.knowledgePointsAverage,
      'gpa': instance.gpa,
    };
