import 'package:esu/features/student_data/data/models/response/finance/invoice_item/invoice_item_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'finance_statics/finance_statics_response_model.dart';

part 'finance_response_model.g.dart';

@JsonSerializable()
class FinanceResponseModel {
  FinanceResponseModel();

  late final bool status;
  late final int code;
  late final List<InvoiceItemResponseModel> data;
  @JsonKey(name: 'invoices_statics')
  late final FinanceStaticsResponseModel invoiceStatics;

  factory FinanceResponseModel.fromJson(Map<String, dynamic> json) => _$FinanceResponseModelFromJson(json);
}

