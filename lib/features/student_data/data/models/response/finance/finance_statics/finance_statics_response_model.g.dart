// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_statics_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinanceStaticsResponseModel _$FinanceStaticsResponseModelFromJson(
        Map<String, dynamic> json) =>
    FinanceStaticsResponseModel()
      ..programCost = (json['program_cost'] as num).toDouble()
      ..paid = (json['paid'] as num).toDouble()
      ..unpaid = (json['unpaid'] as num).toDouble()
      ..balance = (json['balance'] as num).toDouble()
      ..total = (json['total'] as num).toDouble();

Map<String, dynamic> _$FinanceStaticsResponseModelToJson(
        FinanceStaticsResponseModel instance) =>
    <String, dynamic>{
      'program_cost': instance.programCost,
      'paid': instance.paid,
      'unpaid': instance.unpaid,
      'balance': instance.balance,
      'total': instance.total,
    };
