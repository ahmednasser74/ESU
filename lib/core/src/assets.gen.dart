/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/access_to_moodle.png
  AssetGenImage get accessToMoodle => const AssetGenImage('assets/icons/access_to_moodle.png');

  /// File path: assets/icons/add_file.png
  AssetGenImage get addFile => const AssetGenImage('assets/icons/add_file.png');

  /// File path: assets/icons/add_image.png
  AssetGenImage get addImage => const AssetGenImage('assets/icons/add_image.png');

  /// File path: assets/icons/attendance.png
  AssetGenImage get attendance => const AssetGenImage('assets/icons/attendance.png');

  /// File path: assets/icons/download_icon.svg
  SvgGenImage get downloadIcon => const SvgGenImage('assets/icons/download_icon.svg');

  /// File path: assets/icons/email.png
  AssetGenImage get email => const AssetGenImage('assets/icons/email.png');

  /// File path: assets/icons/faq.png
  AssetGenImage get faq => const AssetGenImage('assets/icons/faq.png');

  /// File path: assets/icons/finance_icon.png
  AssetGenImage get financeIcon => const AssetGenImage('assets/icons/finance_icon.png');

  /// File path: assets/icons/identity.png
  AssetGenImage get identity => const AssetGenImage('assets/icons/identity.png');

  /// File path: assets/icons/lecture.png
  AssetGenImage get lecture => const AssetGenImage('assets/icons/lecture.png');

  /// File path: assets/icons/letter_icon.png
  AssetGenImage get letterIcon => const AssetGenImage('assets/icons/letter_icon.png');

  /// File path: assets/icons/location_icon.png
  AssetGenImage get locationIcon => const AssetGenImage('assets/icons/location_icon.png');

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

  /// File path: assets/icons/schedule.png
  AssetGenImage get schedule => const AssetGenImage('assets/icons/schedule.png');

  /// File path: assets/icons/send_message_icon.svg
  SvgGenImage get sendMessageIcon => const SvgGenImage('assets/icons/send_message_icon.svg');

  /// File path: assets/icons/setting_icon.png
  AssetGenImage get settingIcon => const AssetGenImage('assets/icons/setting_icon.png');

  /// File path: assets/icons/study_plan.png
  AssetGenImage get studyPlan => const AssetGenImage('assets/icons/study_plan.png');

  /// File path: assets/icons/term_registration.png
  AssetGenImage get termRegistration => const AssetGenImage('assets/icons/term_registration.png');

  /// File path: assets/icons/ticket.png
  AssetGenImage get ticket => const AssetGenImage('assets/icons/ticket.png');

  /// File path: assets/icons/transcript_icon.png
  AssetGenImage get transcriptIcon => const AssetGenImage('assets/icons/transcript_icon.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_icon.png
  AssetGenImage get appIcon => const AssetGenImage('assets/images/app_icon.png');

  /// File path: assets/images/app_icon_bg.jpeg
  AssetGenImage get appIconBg => const AssetGenImage('assets/images/app_icon_bg.jpeg');

  /// File path: assets/images/app_icon_transparent.png
  AssetGenImage get appIconTransparent => const AssetGenImage('assets/images/app_icon_transparent.png');

  /// File path: assets/images/esu_title_logo.jpeg
  AssetGenImage get esuTitleLogo => const AssetGenImage('assets/images/esu_title_logo.jpeg');

  /// File path: assets/images/student_id.png
  AssetGenImage get studentId => const AssetGenImage('assets/images/student_id.png');
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/celelbration.json
  String get celelbration => 'assets/lottie/celelbration.json';

  /// File path: assets/lottie/empty.json
  String get empty => 'assets/lottie/empty.json';

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

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
