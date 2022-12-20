import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/localization/translation_controller.dart';
import 'package:esu/core/notification_helper/notification_helper.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/theme/theme_controller.dart';
import 'package:esu/core/enum/theme_data_helper.dart';
import 'package:esu/core/enum/language.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/home/presentation/controller/logout_controler_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/domin/usecases/delete_user_account_usecase.dart';

@Injectable()
class SettingController extends GetxController {
  SettingController({
    required this.deleteUserAccountUseCase,
  });

  final DeleteUserAccountUseCase deleteUserAccountUseCase;
  TranslationController? translateController;
  ThemeController? themeController;
  late bool _isDarkMode;
  RxBool loadingDeleteUserAccount = false.obs;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      translateController = Get.find<TranslationController>();
      themeController = Get.find<ThemeController>();
    });
    _isDarkMode = SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value;
  }

  bool get isDarkMode => _isDarkMode;

  void changeTheme() {
    themeController!.changeTheme();
    _isDarkMode = themeController!.isDarkMode;
    update();
  }

  void changeLanguage() {
    translateController = Get.find<TranslationController>();
    if (translateController!.language.value == Language.english.value) {
      translateController!.changeLanguage(Language.arabic);
    } else if (translateController!.language.value == Language.arabic.value) {
      translateController!.changeLanguage(Language.english);
    }
  }

  Future<void> deleteUserAccount() async {
    loadingDeleteUserAccount.value = true;
    final response = await deleteUserAccountUseCase(params: NoParams());
    response.fold(
      (l) => HelperMethod.showSnackBar(
        message: LocalizationKeys.error.tr,
        title: LocalizationKeys.somethingWentWrong.tr,
      ),
      (r) {
        Get.offAllNamed(Routes.loginScreen);
        SharedPrefs.instance.removeAllKeys();
        NotificationHelper.instance.removeToken();
      },
    );
    loadingDeleteUserAccount.value = false;
  }
}
