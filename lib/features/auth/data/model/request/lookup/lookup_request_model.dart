class LookupRequestModel {
  LookupRequestModel({
    required this.lookupType,
  });

  final String lookupType;

  Map<String, dynamic> toJson() => {
        'lookup': lookupType,
      };
}
