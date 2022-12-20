import 'package:esu/core/localization/localization_keys.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:json_annotation/json_annotation.dart';

class ListConst {
  List<String> certificateList = [
    CertificateType.bachelor.name,
    CertificateType.master.name,
    CertificateType.secondarySchool.name,
    // LocalizationKeys.phd.tr,
  ];
}

enum CertificateType {
  @JsonValue('secondary_school')
  secondarySchool,
  @JsonValue('bachelor')
  bachelor,
  @JsonValue('master')
  master,
  // phd,
}

extension CertificateTypeExtension on CertificateType {
  String get value {
    switch (this) {
      case CertificateType.secondarySchool:
        return 'secondary_school';
      case CertificateType.bachelor:
        return 'bachelor';
      case CertificateType.master:
        return 'master';
      // case CertificateType.phd:
      //   return 'phd';
    }
  }

  String get name {
    switch (this) {
      case CertificateType.secondarySchool:
        return LocalizationKeys.secondarySchool.tr;
      case CertificateType.bachelor:
        return LocalizationKeys.bachelor.tr;
      case CertificateType.master:
        return LocalizationKeys.master.tr;
      // case CertificateType.phd:
      //   return LocalizationKeys.phd.tr;
    }
  }
}

CertificateType parseCertificate(final String type) {
  switch (type) {
    case 'secondary_school':
      return CertificateType.secondarySchool;
    case 'bachelor':
      return CertificateType.bachelor;
    case 'master':
      return CertificateType.master;
    default:
      throw Exception('$type is not a valid Location');
  }
}
