import 'package:json_annotation/json_annotation.dart';

part 'invoice_item_response_model.g.dart';

@JsonSerializable()
class InvoiceItemResponseModel {
  InvoiceItemResponseModel();

  late final int id;
  late final String item;
  late final double? total;
  @JsonKey(name: 'paid_amount')
  late final double? paidAmount;
  late final double? remaining;
  late final String status;
  @JsonKey(name: 'original_status')
  late final String originalStatus;
  @JsonKey(name: 'paid_at')
  late final String? paidAt;
  @JsonKey(name: 'due_date')
  late final String? dueDate;
  @JsonKey(ignore: true)
  bool isLoadingToPaymentGateway = false;

  factory InvoiceItemResponseModel.fromJson(Map<String, dynamic> json) => _$InvoiceItemResponseModelFromJson(json);
}
