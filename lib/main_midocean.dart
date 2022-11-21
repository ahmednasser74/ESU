import 'dart:async';

import 'package:esu/core/notification_helper/notification_helper.dart';
import 'package:esu/core/flavor/flavors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'core/dependencies/dependency_init.dart';
import 'core/helper/file_download_helper/file_downloader_db/file_downloader_db.dart';
import 'my_app.dart';

void main() async {
  Flavors.appFlavor = Flavor.midocean;
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
  // runZonedGuarded<Future<void>>(() async {
  await Firebase.initializeApp();
  FlutterDownloader.initialize();
  FileDownloadedDbHelper.init();
  configureDependencies();
  await NotificationHelper.instance.init();
  print('token ${await NotificationHelper.instance.getFcmToken}');
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(const MyApp());
  // }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack, fatal: true));
}
