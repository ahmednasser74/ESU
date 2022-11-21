import 'package:esu/core/src/colors.dart';
import 'package:flutter/material.dart';

import '../src/assets.gen.dart';
import '../src/theme/theme.dart';

enum Flavor {
  prod,
  dev,
  midocean,
}

class Flavors {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static bool get isDev => appFlavor == Flavor.dev;

  static bool get isProd => appFlavor == Flavor.prod;

  static bool get isMidocean => appFlavor == Flavor.midocean;

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'ESU';
      case Flavor.dev:
        return 'ESU Dev';
      case Flavor.midocean:
        return 'Midocean';
      default:
        return 'title';
    }
  }

  static String get appIcon {
    switch (appFlavor) {
      case Flavor.prod:
        return Assets.images.appIcon.path;
      case Flavor.dev:
        return Assets.images.appIconTransparent.path;
      case Flavor.midocean:
        return Assets.images.midoceanAppIcon.path;
      default:
        return Assets.images.appIcon.path;
    }
  }

  static Color get primaryColor {
    switch (appFlavor) {
      case Flavor.prod:
        return AppColors.primaryColor;
      case Flavor.dev:
        return AppColors.primaryColor;
      case Flavor.midocean:
        return AppColors.midoceanPrimaryColor;
      default:
        return AppColors.primaryColor;
    }
  }

  static Color get primaryLightColor {
    switch (appFlavor) {
      case Flavor.prod:
        return AppColors.primaryLightColor;
      case Flavor.dev:
        return AppColors.primaryLightColor;
      case Flavor.midocean:
        return AppColors.midoceanPrimaryLightColor;
      default:
        return AppColors.primaryLightColor;
    }
  }
}
