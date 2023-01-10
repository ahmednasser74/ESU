// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceItemResponseModel _$InvoiceItemResponseModelFromJson(
        Map<String, dynamic> json) =>
    InvoiceItemResponseModel()
      ..id = json['id'] as int
      ..item = json['item'] as String
      ..total = (json['total'] as num?)?.toDouble()
      ..paidAmount = (json['paid_amount'] as num?)?.toDouble()
      ..remaining = (json['remaining'] as num?)?.toDouble()
      ..status = json['status'] as String
      ..originalStatus =
          $enumDecode(_$InvoiceStatusEnumMap, json['original_status'])
      ..paidAt = json['paid_at'] as String?
      ..dueDate = json['due_date'] as String?;

Map<String, dynamic> _$InvoiceItemResponseModelToJson(
        InvoiceItemResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item': instance.item,
      'total': instance.total,
      'paid_amount': instance.paidAmount,
      'remaining': instance.remaining,
      'status': instance.status,
      'original_status': _$InvoiceStatusEnumMap[instance.originalStatus]!,
      'paid_at': instance.paidAt,
      'due_date': instance.dueDate,
    };

const _$InvoiceStatusEnumMap = {
  InvoiceStatus.paid: 'paid',
  InvoiceStatus.halfPaid: 'half_paid',
  InvoiceStatus.unpaid: 'unpaid',
};
