enum Flavor {
  prod,
  dev,
}

class Flavors {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static bool get isDev => appFlavor == Flavor.dev;

  static bool get isProd => appFlavor == Flavor.prod;

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'ESU';
      case Flavor.dev:
        return 'ESU Dev';
      default:
        return 'title';
    }
  }
}
