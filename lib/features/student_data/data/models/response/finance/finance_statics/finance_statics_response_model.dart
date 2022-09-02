import 'package:json_annotation/json_annotation.dart';

part 'finance_statics_response_model.g.dart';

@JsonSerializable()
class FinanceStaticsResponseModel {
  FinanceStaticsResponseModel();

  @JsonKey(name: 'program_cost')
  late final double programCost;
  late final double paid;
  late final double unpaid;
  late final double balance;
  late final double total;

  factory FinanceStaticsResponseModel.fromJson(Map<String, dynamic> json) => _$FinanceStaticsResponseModelFromJson(json);
}
