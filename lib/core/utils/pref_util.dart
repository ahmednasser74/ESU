import 'dart:async';
import 'dart:convert';

import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/features/auth/data/model/response/login/student_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  SharedPreferences? prefs;

  SharedPrefs._internal();

  bool initialized = false;

  static SharedPrefs get instance => _instance;

  Future<SharedPrefs> init() async {
    final Completer<SharedPrefs> completer = Completer<SharedPrefs>();
    if (initialized) {
      completer.complete(_instance);
    } else {
      prefs = await SharedPreferences.getInstance();
      initialized = true;
      completer.complete(_instance);
    }
    return completer.future;
  }

  //----------------------------------------------------------------------
  void saveString({required String key, required String value}) {
    prefs?.setString(key, value);
  }

  String? getString({required String key}) {
    return prefs?.getString(key);
  }

  //----------------------------------------------------------------------
  void saveUser({required StudentResponseModel studentModel}) {
    prefs?.setString(SharedPrefsKeys.user, jsonEncode(studentModel.toJson()));
  }

  StudentResponseModel getUser() {
    return StudentResponseModel.fromJson(
      jsonDecode(prefs?.getString(SharedPrefsKeys.user) ?? ''),
    );
  }

  void removeAllKeys() => prefs?.clear();
}
