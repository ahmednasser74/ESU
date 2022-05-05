//
// import 'package:boilerplate/core/cache/user_preferences/user_preferences.dart';
// import 'package:boilerplate/features/auth/data/model/response/login/login_response_model.dart';
//
// class UserPreferencesHelper implements IUserPreferences {
//   @override
//   void saveUserPreference({
//     required LoginResponseModel? loginModel,
//   }) {
//     di<CacheHelper>().put(
//       SharedPrefsKeys.user,
//       loginModel,
//     );
//   }
//
//   @override
//   LoginModel? getUserPreference() {
//     return LoginModel.fromJson(
//       di<CacheHelper>().get(
//         CacheKeys.userPreference,
//       ),
//     );
//   }
//
//   @override
//   String? getUserTokenPreference() {
//     String? accessToken;
//     if (di<CacheHelper>().has(CacheKeys.userPreference)) {
//       LoginModel model = LoginModel.fromJson(
//         di<CacheHelper>().get(
//           CacheKeys.userPreference,
//         ),
//       );
//       accessToken = model.accessToken;
//     }
//     return accessToken;
//   }
//
//   @override
//   void clearUserPreference() {
//     di<CacheHelper>().clear(
//       CacheKeys.userPreference,
//     );
//   }
// }
