import 'package:package_info_plus/package_info_plus.dart';

class AppInfoHelper {
  static String appVersion = '';

  static String get getAppVersion => appVersion;

  static Future<void> init() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
  }

  static bool needUpdate({
    required String appVersion,
    required String minVersion,
  }) {
    appVersion = appVersion.replaceAll(".", "");
    minVersion = minVersion.replaceAll(".", "");
    return num.parse(minVersion) > num.parse(appVersion);
  }
}
