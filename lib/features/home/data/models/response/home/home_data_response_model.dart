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
        invoiceRedirect: json["invoices_redirect"],
        profileRedirect: json["profile_redirect"],
      );
}
