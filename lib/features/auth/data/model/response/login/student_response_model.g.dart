// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentResponseModel _$StudentResponseModelFromJson(
        Map<String, dynamic> json) =>
    StudentResponseModel()
      ..id = json['id'] as int
      ..nameEn = json['name_en'] as String
      ..nameAr = json['name_ar'] as String
      ..academicId = json['academic_id'] as String
      ..email = json['email'] as String
      ..mobile = json['mobile'] as String
      ..nationalPassport = json['national_passport'] as String
      ..country = json['country'] as String
      ..nationality = json['nationality'] as String
      ..gender = json['gender'] as String
      ..admissionYear = json['admission_year'] as String
      ..archiveStatus = json['archive_status'] as String
      ..locale = json['locale'] as String
      ..publishSocialProfile = json['publish_social_profile'] as bool
      ..whatsPin = json['whats_pin'] as String?
      ..whatsNumber = json['whats_number'] as String?
      ..twitter = json['twitter'] as String?
      ..facebook = json['facebook'] as String?
      ..linkedin = json['linkedin'] as String?
      ..instagram = json['instagram'] as String?
      ..optionalWhatsNumbers =
          (json['optional_whats_numbers'] as List<dynamic>?)
                  ?.map((e) => e as String?)
                  .toList() ??
              []
      ..photo = json['photo'] as String?;

Map<String, dynamic> _$StudentResponseModelToJson(
        StudentResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'academic_id': instance.academicId,
      'email': instance.email,
      'mobile': instance.mobile,
      'national_passport': instance.nationalPassport,
      'country': instance.country,
      'nationality': instance.nationality,
      'gender': instance.gender,
      'admission_year': instance.admissionYear,
      'archive_status': instance.archiveStatus,
      'locale': instance.locale,
      'publish_social_profile': instance.publishSocialProfile,
      'whats_pin': instance.whatsPin,
      'whats_number': instance.whatsNumber,
      'twitter': instance.twitter,
      'facebook': instance.facebook,
      'linkedin': instance.linkedin,
      'instagram': instance.instagram,
      'optional_whats_numbers': instance.optionalWhatsNumbers,
      'photo': instance.photo,
    };
