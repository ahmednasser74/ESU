import 'dart:io';

import 'package:esu/core/file_helper/file_downloader_db/file_downloader_db.dart';
import 'package:esu/core/utils/notification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/localization/translation.dart';
import 'core/src/routes.dart';
import 'core/src/theme.dart';
import 'core/utils/controller_binding.dart';
import 'core/utils/di.dart';
import 'core/utils/pref_util.dart';

void main() async {
  FileDownloadedDbHelper.init();
  FlutterDownloader.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await Injection.init();
  if (Platform.isAndroid) {
    await NotificationHelper.instance.init();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (c, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ESU',
        theme: CustomsThemes.defaultThemeData,
        initialRoute: Routes.splashScreen,
        getPages: Routes.setScreens(),
        initialBinding: ControllerBinding(),
        translations: Translation(),
        fallbackLocale: const Locale('en'),
        locale: Locale(SharedPrefs.instance.getLanguageSelected()),
        builder: (context, widget) {
          // ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget ?? Container(),
          );
        },
      ),
    );
  }
}
