import 'package:app_settings/app_settings.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationPermissionHelper {
  static Future<bool> isPermissionGranted() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   // Location services are not enabled don't continue
    //   // accessing the position and request users of the
    //   // App to enable the location services.
    //   Get.alert(
    //     AlertDialog(
    //       title: Text('Location services are disabled.'),
    //       content: Text('Please enable location services from settings.'),
    //       actions: <Widget>[
    //         FlatButton(
    //           child: Text('OK'),
    //           onPressed: () {
    //             Navigator.pop(context);
    //             AppSettings.openAppSettings();
    //           },
    //         ),
    //       ],
    //     ),
    //   );
    //   AppDialogs.showErrorDialog(
    //     context,
    //     'Location services are disabled.',
    //     dismissable: false,
    //   );
    //   return false;
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        Get.dialog(
          AlertDialog(
            title: const Text('Location Permission Denied'),
            content: const Text('Location permissions are denied, please enable location permission from settings'),
            actions: <Widget>[
              AppButton(
                title: LocalizationKeys.ok.tr,
                onPressed: () => AppSettings.openAppSettings(),
              ),
            ],
          ),
        );
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      Get.dialog(
        AlertDialog(
          title: const Text('Location permissions are permanently denied, we cannot request permissions. please enable location permission from settings'),
          actions: <Widget>[
            AppButton(
              title: LocalizationKeys.ok.tr,
              onPressed: () async {
                Get.back();
                if (!await LocationPermissionHelper.isPermissionGranted()) {
                  AppSettings.openLocationSettings();
                }
              },
            ),
          ],
        ),
      );

      return false;
    }
    return true;
  }
}
