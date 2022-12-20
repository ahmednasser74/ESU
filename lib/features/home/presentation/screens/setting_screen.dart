import 'package:esu/core/extentions/spaces_box.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/features/home/presentation/controller/setting_controller.dart';
import 'package:esu/features/home/presentation/widgets/lagnuage_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/src/widgets/app_float_loading.dart';
import '../widgets/delete_user_account_dialog.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppFloatLoading(
        inAsyncCall: controller.loadingDeleteUserAccount.value,
        child: Scaffold(
          appBar: AppBar(title: Text(LocalizationKeys.settings.tr)),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    LocalizationKeys.language.tr,
                    style:  TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LanguageButtonWidget(
                        language: 'English',
                        color: Get.locale.toString() == 'en' ? Theme.of(context).primaryColor : Colors.grey,
                        onTap: controller.changeLanguage,
                      ),
                      SizedBox(width: 10.w),
                      LanguageButtonWidget(
                        language: 'عربي',
                        color: Get.locale.toString() == 'ar' ? Theme.of(context).primaryColor : Colors.grey,
                        onTap: controller.changeLanguage,
                      ),
                    ],
                  ),
                ),
                // GetBuilder<SettingController>(
                //   builder: (controller) => SwitchListTile(
                //     value: controller.isDarkMode,
                //     onChanged: (newValue) => controller.changeTheme(),
                //     title: Text(LocalizationKeys.darkMode.tr, style: const TextStyle(color: AppColors.primaryColor)),
                //     // activeTrackColor: AppColors.primaryColor.withOpacity(.7),
                //   ),
                // ),
                const Spacer(),
                Text(
                  LocalizationKeys.dangerZone.tr,
                  style: TextStyle(fontSize: 18.sp, color: Colors.red),
                ),
                const Divider(color: Colors.grey),
                18.heightBox,
                AppButton(
                  onPressed: () => Get.dialog(
                    DeleteUserAccountDialog(onTapDeleteAccount: controller.deleteUserAccount),
                  ),
                  title: LocalizationKeys.deleteUserAccount.tr,
                  backgroundColor: Colors.red,
                  minimumSize: Size(double.infinity, 40.h),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
