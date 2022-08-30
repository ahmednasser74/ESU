import 'package:esu/features/home/data/models/response/home/program_progress_item_response_model.dart';

class HomeDataResponseModel {
  HomeDataResponseModel({
    required this.program,
    required this.photo,
    required this.name,
    required this.programCost,
    required this.paid,
    required this.unpaid,
    required this.balance,
    required this.total,
    required this.invoiceRedirect,
    required this.profileRedirect,
    required this.programProgress,
    required this.knowledgePointsAverage,
  });

  final String program;
  final String photo;
  final String name;
  final dynamic programCost;
  final dynamic paid;
  final dynamic unpaid;
  final dynamic balance;
  final dynamic total;
  final bool profileRedirect;
  final bool invoiceRedirect;
  final List<ProgramProgressItemResponseModel> programProgress;
  final int knowledgePointsAverage;

  factory HomeDataResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeDataResponseModel(
      program: json["program"],
      photo: json["photo"],
      name: json["name"],
      programCost: json["program_cost"],
      paid: json["paid"],
      unpaid: json["unpaid"],
      balance: json["balance"],
      total: json["total"],
      invoiceRedirect: json["invoices_redirect"],
      profileRedirect: json["profile_redirect"],
      programProgress: json['programs_progress'] == null
          ? []
          : List<ProgramProgressItemResponseModel>.from(
              json["programs_progress"].map((x) => ProgramProgressItemResponseModel.fromJson(x)),
            ),
      knowledgePointsAverage: json["Knowledge_points_avg"],
    );
  }
}
