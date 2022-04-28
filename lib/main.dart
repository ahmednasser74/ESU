import 'package:boilerplate/core/localization/translation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'core/localization/translation.dart';
import 'core/src/routes.dart';
import 'core/src/theme.dart';
import 'core/utils/controller_binding.dart';
import 'core/utils/injection_container.dart';
import 'core/utils/pref_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await Injection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (c) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ESU',
        theme: CustomsThemes.defaultThemeData,
        initialRoute: Routes.splashScreen,
        getPages: Routes.setScreens(),
        initialBinding: ControllerBinding(),
        translations: Translation(),
        fallbackLocale: Locale('en'),
        locale: Locale(SharedPrefs.instance.getLanguageSelected()),
        builder: (context, widget) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget ?? Container(),
        ),
      ),
    );
  }
}
