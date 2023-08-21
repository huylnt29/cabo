/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/cabo.svg
  SvgGenImage get cabo => const SvgGenImage('assets/icons/cabo.svg');

  /// File path: assets/icons/drive_history.svg
  SvgGenImage get driveHistory =>
      const SvgGenImage('assets/icons/drive_history.svg');

  /// File path: assets/icons/favorite_location.svg
  SvgGenImage get favoriteLocation =>
      const SvgGenImage('assets/icons/favorite_location.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// List of all assets
  List<SvgGenImage> get values => [cabo, driveHistory, favoriteLocation, home];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/auth_illustration.png
  AssetGenImage get authIllustration =>
      const AssetGenImage('assets/images/auth_illustration.png');

  /// File path: assets/images/cabo.png
  AssetGenImage get cabo => const AssetGenImage('assets/images/cabo.png');

  /// File path: assets/images/car4.png
  AssetGenImage get car4 => const AssetGenImage('assets/images/car4.png');

  /// File path: assets/images/car7.png
  AssetGenImage get car7 => const AssetGenImage('assets/images/car7.png');

  /// File path: assets/images/car_booking_background.jpg
  AssetGenImage get carBookingBackground =>
      const AssetGenImage('assets/images/car_booking_background.jpg');

  /// File path: assets/images/money.png
  AssetGenImage get money => const AssetGenImage('assets/images/money.png');

  /// File path: assets/images/motorcycle.png
  AssetGenImage get motorcycle =>
      const AssetGenImage('assets/images/motorcycle.png');

  /// File path: assets/images/splash_screen_background.jpg
  AssetGenImage get splashScreenBackground =>
      const AssetGenImage('assets/images/splash_screen_background.jpg');

  /// File path: assets/images/success.gif
  AssetGenImage get success => const AssetGenImage('assets/images/success.gif');

  /// File path: assets/images/wallet.png
  AssetGenImage get wallet => const AssetGenImage('assets/images/wallet.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        authIllustration,
        cabo,
        car4,
        car7,
        carBookingBackground,
        money,
        motorcycle,
        splashScreenBackground,
        success,
        wallet
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
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
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
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
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
