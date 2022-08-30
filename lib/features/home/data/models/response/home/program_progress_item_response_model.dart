import 'package:json_annotation/json_annotation.dart';

part 'program_progress_item_response_model.g.dart';

@JsonSerializable()
class ProgramProgressItemResponseModel {
  ProgramProgressItemResponseModel({required this.completePercentage, required this.name});

  @JsonKey(name: "completed_percent")
  final int completePercentage;
  final String name;

  factory ProgramProgressItemResponseModel.fromJson(Map<String, dynamic> json) => _$ProgramProgressItemResponseModelFromJson(json);
}
