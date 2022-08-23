enum Language { english, arabic }

extension LanguageHelper on Language {
  String get value {
    switch (this) {
      case Language.arabic:
        return 'ar';
      case Language.english:
        return 'en';
    }
  }

  set value(String value) {
    if (value == Language.arabic.value) {
      value = Language.arabic.value;
    } else {
      value = Language.english.value;
    }
  }
}
