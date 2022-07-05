import 'package:esu/core/file_helper/file_downloader_db/file_downloader_db.dart';
import 'package:esu/core/utils/notification_helper.dart';
import 'package:esu/core/flavor/flavors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'core/utils/di.dart';
import 'my_app.dart';

void main() async {
  Flavors.appFlavor = Flavor.prod;
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
  FlutterDownloader.initialize();
  FileDownloadedDbHelper.init();
  await Injection.init();
  await NotificationHelper.instance.init();
  runApp(const MyApp());
}
