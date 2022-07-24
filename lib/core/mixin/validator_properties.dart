import 'package:esu/core/localization/localization_keys.dart';
import 'package:get/get.dart';

mixin ValidatorProperties {
  String? addressValidator(String? v) {
    if (v!.isEmpty) {
      return LocalizationKeys.thisFieldIsRequired.tr;
    } else if (v.length < 10) {
      return LocalizationKeys.atLeast10Characters.tr;
    }
    return null;
  }

  String? nameValidator(String? v) {
    if (v!.isEmpty) {
      return LocalizationKeys.thisFieldIsRequired.tr;
    } else if (v.length <= 3) {
      return LocalizationKeys.atLeast3Characters.tr;
    }
    return null;
  }

  String? emailValidator(String? v) {
    final pattern = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );
    if (v!.isEmpty) {
      return LocalizationKeys.emailIsRequired.tr;
    } else if (!pattern.hasMatch(v)) {
      return LocalizationKeys.enterValidEmailFormat.tr;
    }
    return null;
  }

  String? nationalIdValidator(String? v) {
    if (v!.isEmpty) {
      return LocalizationKeys.thisFieldIsRequired.tr;
    } else if (v.length < 3) {
      return LocalizationKeys.atLeast3Characters.tr;
    }
    return null;
  }

  String? phoneValidator(String? v) {
    if (v!.isEmpty) {
      return LocalizationKeys.thisFieldIsRequired.tr;
    } else if (isPhoneNumber(v)) {
      return LocalizationKeys.enterValidFormat.tr;
    }
    return null;
  }

  static bool isPhoneNumber(String s) {
    if (s.length < 16 && s.length > 7) return false;
    return true;
  }

  String? passwordValidator(String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return LocalizationKeys.passwordIsRequired.tr;
    } else if (value.length < 8) {
      return LocalizationKeys.atLeast8Characters.tr;
    } else if (!regExp.hasMatch(value)) {
      return LocalizationKeys.passwordMustContain.tr;
    } else {
      return null;
    }
  }
}
