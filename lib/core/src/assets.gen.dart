/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add_file.png
  AssetGenImage get addFile => const AssetGenImage('assets/icons/add_file.png');

  /// File path: assets/icons/add_image.png
  AssetGenImage get addImage => const AssetGenImage('assets/icons/add_image.png');

  /// File path: assets/icons/email.png
  AssetGenImage get email => const AssetGenImage('assets/icons/email.png');

  /// File path: assets/icons/finance_icon.png
  AssetGenImage get financeIcon => const AssetGenImage('assets/icons/finance_icon.png');

  /// File path: assets/icons/identity.png
  AssetGenImage get identity => const AssetGenImage('assets/icons/identity.png');

  /// File path: assets/icons/letter_icon.png
  AssetGenImage get letterIcon => const AssetGenImage('assets/icons/letter_icon.png');

  /// File path: assets/icons/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/icons/lock.png');

  /// File path: assets/icons/logout.png
  AssetGenImage get logout => const AssetGenImage('assets/icons/logout.png');

  /// File path: assets/icons/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/icons/menu.png');

  /// File path: assets/icons/mobile.png
  AssetGenImage get mobile => const AssetGenImage('assets/icons/mobile.png');

  /// File path: assets/icons/notification_icon.png
  AssetGenImage get notificationIcon => const AssetGenImage('assets/icons/notification_icon.png');

  /// File path: assets/icons/pdf.png
  AssetGenImage get pdf => const AssetGenImage('assets/icons/pdf.png');

  /// File path: assets/icons/profile_icon.png
  AssetGenImage get profileIcon => const AssetGenImage('assets/icons/profile_icon.png');

  /// File path: assets/icons/setting_icon.png
  AssetGenImage get settingIcon => const AssetGenImage('assets/icons/setting_icon.png');

  /// File path: assets/icons/study_plan.png
  AssetGenImage get studyPlan => const AssetGenImage('assets/icons/study_plan.png');

  /// File path: assets/icons/transcript_icon.png
  AssetGenImage get transcriptIcon => const AssetGenImage('assets/icons/transcript_icon.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/esu_title_logo.png
  AssetGenImage get esuTitleLogo => const AssetGenImage('assets/images/esu_title_logo.png');
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/celelbration.json
  String get celelbration => 'assets/lottie/celelbration.json';

  /// File path: assets/lottie/error.json
  String get error => 'assets/lottie/error.json';

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// File path: assets/lottie/no_internet.json
  String get noInternet => 'assets/lottie/no_internet.json';
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
