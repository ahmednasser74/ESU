import 'package:esu/core/file_helper/file_downloader_db/file_downloader_db.dart';
import 'package:esu/core/flavor/flavors.dart';
import 'package:esu/core/notification_helper/notification_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
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
    statusBarColor: Colors.grey,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await Injection.init();
  await Firebase.initializeApp();
  FlutterDownloader.initialize();
  FileDownloadedDbHelper.init();
  await NotificationHelper.instance.init();
  runApp(const MyApp());
}
