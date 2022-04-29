mixin ValidatorProperties {
  String? addressValidator(String? v) {
    if (v!.isEmpty) {
      return 'This field is required';
    } else if (v.length < 10) {
      return 'Enter valid address';
    }
    return null;
  }

  String? nameValidator(String? v) {
    if (v!.isEmpty) {
      return 'This field is required';
    } else if (v.length <= 3) {
      return 'Enter valid name';
    }
    return null;
  }

  String? emailValidator(String? v) {
    if (v!.isEmpty) {
      return 'This field is required';
    } else if (isValidEmail(v)) {
      return 'Enter right email format';
    }
    return null;
  }

  String? nationalIdValidator(String? v) {
    if (v!.isEmpty) {
      return 'This field is required';
    } else if (isPhoneNumber(v)) {
      return 'Enter right email format';
    }
    return null;
  }

  String? phoneValidator(String? v) {
    if (v!.isEmpty) {
      return 'This field is required';
    } else if (isPhoneNumber(v)) {
      return 'Enter right email format';
    }
    return null;
  }

  bool isValidEmail(String value) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value);
  }

  static bool isPhoneNumber(String s) {
    if (s.length < 16 && s.length > 7) return false;
    return true;
  }
}
