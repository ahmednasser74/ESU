import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/src/theme/theme.dart';
import 'package:esu/core/enum/theme_data_helper.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ThemeController extends GetxController {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  @override
  void onInit() async {
    setDarkMode();
    Get.changeTheme(_isDarkMode ? AppThemes.darkThemeData : AppThemes.lightThemeData);
    super.onInit();
  }

  void changeTheme() {
    final isDarkMode = SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value;
    Get.changeTheme(isDarkMode ? AppThemes.lightThemeData : AppThemes.darkThemeData);
    SharedPrefs.instance.saveString(key: SharedPrefsKeys.themeMode, value: isDarkMode ? ThemeDataHelper.light.value : ThemeDataHelper.dark.value);
    setDarkMode();
    update();
  }

  void setDarkMode() {
    _isDarkMode = SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.light.value;
  }
}
