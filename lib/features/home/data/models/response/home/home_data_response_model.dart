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
  });

  final String program;
  final String photo;
  final String name;
  final int programCost;
  final int paid;
  final int unpaid;
  final int balance;
  final int total;

  factory HomeDataResponseModel.fromJson(Map<String, dynamic> json) =>
      HomeDataResponseModel(
        program: json["program"],
        photo: json["photo"],
        name: json["name"],
        programCost: json["program_cost"],
        paid: json["paid"],
        unpaid: json["unpaid"],
        balance: json["balance"],
        total: json["total"],
      );
}
