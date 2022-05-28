class FinanceDataResponseModel {
  FinanceDataResponseModel({
    required this.id,
    required this.item,
    required this.total,
    required this.paidAmount,
    required this.remaining,
    required this.status,
    required this.originalStatus,
    this.paidAt,
    this.dueDate,
  });

  final int id;
  final String item;
  final int total;
  final int paidAmount;
  final int remaining;
  final String status;
  final String originalStatus;
  final String? paidAt;
  final String? dueDate;

  factory FinanceDataResponseModel.fromJson(Map<String, dynamic> json) =>
      FinanceDataResponseModel(
        id: json["id"],
        item: json["item"],
        total: json["total"],
        paidAmount: json["paid_amount"],
        remaining: json["remaining"],
        status: json["status"],
        originalStatus: json["original_status"],
        paidAt: json["paid_at"],
        dueDate: json["due_date"],
      );
}
