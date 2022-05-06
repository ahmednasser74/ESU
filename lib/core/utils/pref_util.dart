import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/core/const/shared_prefs_keys.dart';
import 'package:boilerplate/features/auth/data/model/response/login/login_data_response_model.dart';
import 'package:boilerplate/features/auth/data/model/response/login/login_response_model.dart';
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
  void saveLanguage(String language) {
    prefs?.setString(SharedPrefsKeys.language, language);
  }

  String getLanguageSelected() {
    return prefs?.getString(SharedPrefsKeys.language) ?? 'ar';
  }

  //----------------------------------------------------------------------
  void saveToken({required String token}) {
    prefs?.setString(SharedPrefsKeys.token, token);
  }

  String? getToken() {
    return prefs?.getString(SharedPrefsKeys.token);
  }

  //----------------------------------------------------------------------
  void saveUser({required LoginDataResponseModel loginModel}) {
    prefs?.setString(SharedPrefsKeys.user, jsonEncode(loginModel.toJson()));
  }

  LoginResponseModel getUser() {
    return LoginResponseModel.fromJson(
      jsonDecode(prefs?.getString(SharedPrefsKeys.user) ?? ''),
    );
  }

  void removeAllKeys() => prefs?.clear();
}
