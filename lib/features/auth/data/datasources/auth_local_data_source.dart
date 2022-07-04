import 'package:esu/core/utils/pref_util.dart';

abstract class AuthLocalDataSource {
  // void saveUserToken(String userToken);
  //
  // String? getUserToken();

  void clearCache();
}

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  const AuthLocalDataSourceImp({required this.sharedPreferences});

  final SharedPrefs sharedPreferences;

  // @override
  // void saveUserToken(String userToken) =>
  //     sharedPreferences.saveString(key: userToken);
  //
  // @override
  // String? getUserToken() => sharedPreferences.getToken();

  @override
  void clearCache() => sharedPreferences.removeAllKeys();
}
