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
}
