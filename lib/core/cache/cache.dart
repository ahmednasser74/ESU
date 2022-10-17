import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

abstract class CacheHelper {
  T? get<T>(String key);

  bool has(String key);

  void clear(String key);

  void set(String key, dynamic value);
}

@Singleton(as: CacheHelper)
class CacheHelperImpl implements CacheHelper {
  final SharedPreferences _sharedPreferences;

  CacheHelperImpl(this._sharedPreferences);

  @override
  bool has(String key) {
    return (_sharedPreferences.containsKey(key) &&
        _sharedPreferences.get(key) != null);
  }

  @override
  void clear(String key) {
    _sharedPreferences.remove(key);
  }

  @override
  T? get<T>(String key) {
    if (has(key)) {
      return jsonDecode(_sharedPreferences.getString(key)!);
    } else {
      return null;
    }
  }

  @override
  void set(String key, dynamic value) {
    _sharedPreferences.setString(key, jsonEncode(value));
  }
}
