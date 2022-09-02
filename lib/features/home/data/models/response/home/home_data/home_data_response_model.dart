import 'package:json_annotation/json_annotation.dart';

import '../program_progress_item_response_model.dart';

part 'home_data_response_model.g.dart';

@JsonSerializable()
class HomeDataResponseModel {
  HomeDataResponseModel();

  late final String program;
  late final String photo;
  late final String name;
  @JsonKey(name: 'profile_redirect')
  late final bool profileRedirect;
  @JsonKey(name: 'invoices_redirect')
  late final bool invoiceRedirect;
  @JsonKey(name: 'programs_progress')
  late final List<ProgramProgressItemResponseModel> programProgress;
  @JsonKey(name: 'Knowledge_points_avg')
  late final int knowledgePointsAverage;
  late final double gpa;

  factory HomeDataResponseModel.fromJson(Map<String, dynamic> json) => _$HomeDataResponseModelFromJson(json);
}
