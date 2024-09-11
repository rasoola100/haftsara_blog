/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow-bottom.svg
  SvgGenImage get arrowBottom =>
      const SvgGenImage('assets/icons/arrow-bottom.svg');

  /// File path: assets/icons/hashtag.png
  AssetGenImage get hashtag => const AssetGenImage('assets/icons/hashtag.png');

  /// File path: assets/icons/home-icon.png
  AssetGenImage get homeIcon =>
      const AssetGenImage('assets/icons/home-icon.png');

  /// File path: assets/icons/pen.png
  AssetGenImage get pen => const AssetGenImage('assets/icons/pen.png');

  /// File path: assets/icons/podcast.png
  AssetGenImage get podcast => const AssetGenImage('assets/icons/podcast.png');

  /// File path: assets/icons/robot-icon.svg
  SvgGenImage get robotIcon => const SvgGenImage('assets/icons/robot-icon.svg');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// File path: assets/icons/writer.png
  AssetGenImage get writer => const AssetGenImage('assets/icons/writer.png');

  /// List of all assets
  List<dynamic> get values =>
      [arrowBottom, hashtag, homeIcon, pen, podcast, robotIcon, user, writer];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/arrow-bottom.svg
  SvgGenImage get arrowBottom =>
      const SvgGenImage('assets/images/arrow-bottom.svg');

  /// File path: assets/images/avatar.jpg
  AssetGenImage get avatar => const AssetGenImage('assets/images/avatar.jpg');

  /// File path: assets/images/avatar2.jpg
  AssetGenImage get avatar2 => const AssetGenImage('assets/images/avatar2.jpg');

  /// File path: assets/images/avatar3.jpg
  AssetGenImage get avatar3 => const AssetGenImage('assets/images/avatar3.jpg');

  /// File path: assets/images/avatar4.webp
  AssetGenImage get avatar4 =>
      const AssetGenImage('assets/images/avatar4.webp');

  /// File path: assets/images/content-marketing.jpg
  AssetGenImage get contentMarketing =>
      const AssetGenImage('assets/images/content-marketing.jpg');

  /// File path: assets/images/flutter.png
  AssetGenImage get flutter => const AssetGenImage('assets/images/flutter.png');

  /// File path: assets/images/hamadan.jpeg
  AssetGenImage get hamadan =>
      const AssetGenImage('assets/images/hamadan.jpeg');

  /// File path: assets/images/kermanshah.jpg
  AssetGenImage get kermanshah =>
      const AssetGenImage('assets/images/kermanshah.jpg');

  /// File path: assets/images/khansar.jpg
  AssetGenImage get khansar => const AssetGenImage('assets/images/khansar.jpg');

  /// File path: assets/images/laptop.jpeg
  AssetGenImage get laptop => const AssetGenImage('assets/images/laptop.jpeg');

  /// File path: assets/images/linux.jpg
  AssetGenImage get linux => const AssetGenImage('assets/images/linux.jpg');

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/mazandaran.jpg
  AssetGenImage get mazandaran =>
      const AssetGenImage('assets/images/mazandaran.jpg');

  /// File path: assets/images/nft.webp
  AssetGenImage get nft => const AssetGenImage('assets/images/nft.webp');

  /// File path: assets/images/programming-money.jpeg
  AssetGenImage get programmingMoney =>
      const AssetGenImage('assets/images/programming-money.jpeg');

  /// File path: assets/images/robot-icon.svg
  SvgGenImage get robotIcon =>
      const SvgGenImage('assets/images/robot-icon.svg');

  /// File path: assets/images/shiraz.jpg
  AssetGenImage get shiraz => const AssetGenImage('assets/images/shiraz.jpg');

  /// File path: assets/images/tehran.webp
  AssetGenImage get tehran => const AssetGenImage('assets/images/tehran.webp');

  /// File path: assets/images/yazd.jpg
  AssetGenImage get yazd => const AssetGenImage('assets/images/yazd.jpg');

  /// List of all assets
  List<dynamic> get values => [
        arrowBottom,
        avatar,
        avatar2,
        avatar3,
        avatar4,
        contentMarketing,
        flutter,
        hamadan,
        kermanshah,
        khansar,
        laptop,
        linux,
        logo,
        mazandaran,
        nft,
        programmingMoney,
        robotIcon,
        shiraz,
        tehran,
        yazd
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
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
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
