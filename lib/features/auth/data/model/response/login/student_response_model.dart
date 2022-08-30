class StudentResponseModel {
  StudentResponseModel({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.academicId,
    required this.email,
    required this.mobile,
    required this.nationalPassport,
    required this.photo,
    required this.country,
    required this.nationality,
    required this.gender,
    required this.admissionYear,
    required this.archiveStatus,
    required this.locale,
    required this.publishSocialProfile,
  });

  final int id;
  final String nameEn;
  final String nameAr;
  final String academicId;
  final String email;
  final String mobile;
  final String nationalPassport;
  String? photo;
  final String country;
  final String nationality;
  final String gender;
  final String admissionYear;
  final String archiveStatus;
  final String locale;
  final int publishSocialProfile;

  factory StudentResponseModel.fromJson(Map<String, dynamic> json) =>
      StudentResponseModel(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        academicId: json["academic_id"],
        email: json["email"],
        mobile: json["mobile"],
        nationalPassport: json["national_passport"],
        photo: json["photo"] is Map ? null : json["photo"],
        country: json["country"],
        nationality: json["nationality"],
        gender: json["gender"],
        admissionYear: json["admission_year"],
        archiveStatus: json["archive_status"],
        locale: json["locale"],
        publishSocialProfile: json["publish_social_profile"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "academic_id": academicId,
        "email": email,
        "mobile": mobile,
        "national_passport": nationalPassport,
        "photo": photo,
        "country": country,
        "nationality": nationality,
        "gender": gender,
        "admission_year": admissionYear,
        "archive_status": archiveStatus,
        "locale": locale,
        "publish_social_profile": publishSocialProfile == true ? 1 : 0,
      };

  bool get isAgreePublishSocialProfile => publishSocialProfile == 1 ? true : false;
}