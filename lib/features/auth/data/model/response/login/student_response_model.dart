import 'package:json_annotation/json_annotation.dart';

part 'student_response_model.g.dart';

@JsonSerializable()
class StudentResponseModel {
  StudentResponseModel();

  late final int id;
  @JsonKey(name: 'name_en')
  late final String nameEn;
  @JsonKey(name: 'name_ar')
  late final String nameAr;
  @JsonKey(name: 'academic_id')
  late final String academicId;
  late final String email;
  late final String mobile;
  @JsonKey(name: 'national_passport')
  late final String nationalPassport;
  late final String country;
  late final String nationality;
  late final String gender;
  @JsonKey(name: 'admission_year')
  late final String admissionYear;
  @JsonKey(name: 'archive_status')
  late final String archiveStatus;
  late final String locale;
  @JsonKey(name: 'publish_social_profile')
  late final bool publishSocialProfile;
  @JsonKey(name: 'whats_pin')
  late final String? whatsPin;
  @JsonKey(name: 'whats_number')
  late final String? whatsNumber;
  late final String? twitter;
  late final String? facebook;
  late final String? linkedin;
  late final String? instagram;
  @JsonKey(name: 'optional_whats_numbers', defaultValue: [], includeIfNull: true)
  late final List<String?> optionalWhatsNumbers;
  String? photo;

  factory StudentResponseModel.fromJson(Map<String, dynamic> json) => _$StudentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentResponseModelToJson(this);

  String? get whatsNumber1 => optionalWhatsNumbers.first;

  String? get whatsNumber2 => optionalWhatsNumbers.elementAt(1);
}
