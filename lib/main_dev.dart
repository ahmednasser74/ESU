import 'package:esu/core/flavor/flavors.dart';
import 'package:esu/core/notification_helper/notification_helper.dart';
import 'package:esu/core/src/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'core/dependencies/dependency_init.dart';
import 'core/helper/file_download_helper/file_downloader_db/file_downloader_db.dart';
import 'core/utils/di.dart';
import 'my_app.dart';

void main() async {
  Flavors.appFlavor = Flavor.dev;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryLightColor,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.primaryLightColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  configureDependencies();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize();
  await FileDownloadedDbHelper.init();
  await Injection.init();
  await NotificationHelper.instance.init();
  runApp(const MyApp());
}
