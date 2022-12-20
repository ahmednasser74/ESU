// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinanceResponseModel _$FinanceResponseModelFromJson(
        Map<String, dynamic> json) =>
    FinanceResponseModel()
      ..status = json['status'] as bool
      ..code = json['code'] as int
      ..data = (json['data'] as List<dynamic>)
          .map((e) =>
              InvoiceItemResponseModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..invoiceStatics = FinanceStaticsResponseModel.fromJson(
          json['invoices_statics'] as Map<String, dynamic>);

Map<String, dynamic> _$FinanceResponseModelToJson(
        FinanceResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
      'invoices_statics': instance.invoiceStatics,
    };
