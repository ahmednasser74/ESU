class AvailabilityTermRegistrationDataResponseModel {
  AvailabilityTermRegistrationDataResponseModel({
    required this.item,
    required this.program,
    required this.trimester,
    required this.scholarship,
    required this.cost,
  });

  final String item;
  final String program;
  final String trimester;
  final String scholarship;
  final int cost;

  factory AvailabilityTermRegistrationDataResponseModel.fromJson(
          Map<String, dynamic> json) =>
      AvailabilityTermRegistrationDataResponseModel(
        item: json["item"],
        program: json["program"],
        trimester: json["trimester"],
        scholarship: json["scholarship"],
        cost: json["cost"],
      );
}
