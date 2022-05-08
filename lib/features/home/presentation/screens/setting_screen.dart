import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/features/home/presentation/controller/setting_controller.dart';
import 'package:boilerplate/features/home/presentation/widgets/lagnuage_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
              title: Text(LocalizationKeys.language.tr),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LanguageButtonWidget(
                    language: 'English',
                    color: Get.locale.toString() == 'en'
                        ? Colors.blue
                        : Colors.grey,
                    onTap: controller.changeLanguage,
                  ),
                  SizedBox(width: 10.w),
                  LanguageButtonWidget(
                    language: 'عربي',
                    color: Get.locale.toString() == 'ar'
                        ? Colors.blue
                        : Colors.grey,
                    onTap: controller.changeLanguage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
