import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/theme/theme_controller.dart';
import 'package:esu/core/src/theme/theme_mode.dart';
import 'package:esu/features/home/presentation/controller/setting_controller.dart';
import 'package:esu/features/home/presentation/widgets/lagnuage_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/const/shared_prefs_keys.dart';
import '../../../../core/utils/pref_util.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.settings.tr)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          children: [
            ListTile(
              title: Text(LocalizationKeys.language.tr,style: const TextStyle(color: AppColors.primaryColor),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LanguageButtonWidget(
                    language: 'English',
                    color: Get.locale.toString() == 'en' ? Colors.blue : Colors.grey,
                    onTap: controller.changeLanguage,
                  ),
                  SizedBox(width: 10.w),
                  LanguageButtonWidget(
                    language: 'عربي',
                    color: Get.locale.toString() == 'ar' ? Colors.blue : Colors.grey,
                    onTap: controller.changeLanguage,
                  ),
                ],
              ),
            ),
            GetBuilder<ThemeController>(
              builder: (themeController) => SwitchListTile(
                value: SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value ? true : false,
                onChanged: (newValue) => themeController.changeTheme(),
                title: Text(LocalizationKeys.darkMode.tr,style: const TextStyle(color: AppColors.primaryColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
