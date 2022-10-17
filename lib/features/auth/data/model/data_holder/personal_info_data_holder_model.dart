class PersonalInformationDataHolderModel {
  final String email;
  final String firstNameEnglish;
  final String lastNameEnglish;
  final String secondNameEnglish;
  final String firstNameArabic;
  final String secondNameArabic;
  final String lastNameArabic;
  final String nationalPassport;
  final String mobileNumber;
  final String birthDate;
  final String gender;
  final int countryId;
  final int nationalityId;
  final String? yourJob;
  final String? yourCompany;
  final String currentAddress;

  PersonalInformationDataHolderModel({
    required this.email,
    required this.firstNameEnglish,
    required this.lastNameEnglish,
    required this.secondNameEnglish,
    required this.firstNameArabic,
    required this.secondNameArabic,
    required this.lastNameArabic,
    required this.nationalPassport,
    required this.mobileNumber,
    required this.birthDate,
    required this.gender,
    required this.countryId,
    required this.nationalityId,
    required this.currentAddress,
    this.yourJob,
    this.yourCompany,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'firstNameEnglish': firstNameEnglish,
        'lastNameEnglish': lastNameEnglish,
        'secondNameEnglish': secondNameEnglish,
        'firstNameArabic': firstNameArabic,
        'secondNameArabic': secondNameArabic,
        'lastNameArabic': lastNameArabic,
        'nationalPassport': nationalPassport,
        'mobileNumber': mobileNumber,
        'birthDate': birthDate,
        'gender': gender,
        'countryId': countryId,
        'nationalityId': nationalityId,
        'currentAddress': currentAddress,
        'yourJob': yourJob,
        'yourCompany': yourCompany,
      };

  factory PersonalInformationDataHolderModel.fromJson(Map<String, dynamic> json) {
    return PersonalInformationDataHolderModel(
      email: json['email'],
      firstNameEnglish: json['firstNameEnglish'],
      lastNameEnglish: json['lastNameEnglish'],
      secondNameEnglish: json['secondNameEnglish'],
      firstNameArabic: json['firstNameArabic'],
      secondNameArabic: json['secondNameArabic'],
      lastNameArabic: json['lastNameArabic'],
      nationalPassport: json['nationalPassport'],
      mobileNumber: json['mobileNumber'],
      birthDate: json['birthDate'],
      gender: json['gender'],
      countryId: json['countryId'],
      nationalityId: json['nationalityId'],
      currentAddress: json['currentAddress'],
      yourJob: json['yourJob'],
      yourCompany: json['yourCompany'],
    );
  }
}
