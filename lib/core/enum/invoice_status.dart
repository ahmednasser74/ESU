import 'package:json_annotation/json_annotation.dart';

enum InvoiceStatus {
  @JsonValue('paid')
  paid,
  @JsonValue('half_paid')
  halfPaid,
  @JsonValue('unpaid')
  unpaid
}
