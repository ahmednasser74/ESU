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
    } else if (v.length < 10) {
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

   String? passwordValidator(String? value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return 'This field is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!regExp.hasMatch(value)) {
      return 'Password must contain one upper case and lower case letter,and special character';
    } else {
      return null;
    }
  }
}
