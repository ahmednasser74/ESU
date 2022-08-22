import 'package:esu/core/const/shared_prefs_keys.dart';
import 'package:esu/core/src/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'core/flavor/flavors.dart';
import 'core/src/theme.dart';
import 'core/src/theme/theme_mode.dart';
import 'core/src/widgets/conditional_builder.dart';
import 'core/localization/translation.dart';
import 'core/src/routes.dart';
import 'core/utils/controller_binding.dart';
import 'core/utils/pref_util.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return GetBuilder<ThemeController>(
      builder: (themeController) => ScreenUtilInit(
        builder: (c, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ESU',
          theme: CustomsThemes().getTheme,
          darkTheme: CustomsThemes.darkThemeData,
          initialRoute: Routes.splashScreen,
          // themeMode: SharedPrefs.instance.getString(key: SharedPrefsKeys.themeMode) == ThemeDataHelper.dark.value? ThemeMode.dark : ThemeMode.light,
          getPages: Routes.setScreens(),
          initialBinding: ControllerBinding(),
          translations: Translation(),
          fallbackLocale: const Locale('en'),
          locale: Locale(SharedPrefs.instance.getString(key: SharedPrefsKeys.language) ?? 'ar'),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: ConditionalBuilder(
                condition: Flavors.isDev,
                builder: (_) => Banner(
                  location: BannerLocation.bottomStart,
                  message: Flavors.name,
                  color: Colors.red.withOpacity(0.6),
                  textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12.0, letterSpacing: 1.0),
                  textDirection: TextDirection.ltr,
                  child: widget ?? Container(),
                ),
                fallback: (_) => widget ?? Container(),
              ),
            );
          },
        ),
      ),
    );
  }
}
