// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ai_star.svg
  String get aiStar => 'assets/icons/ai_star.svg';

  /// File path: assets/icons/bolt.svg
  String get bolt => 'assets/icons/bolt.svg';

  /// File path: assets/icons/corner_up_right.svg
  String get cornerUpRight => 'assets/icons/corner_up_right.svg';

  /// File path: assets/icons/cottation.svg
  String get cottation => 'assets/icons/cottation.svg';

  /// File path: assets/icons/cottation_swap.svg
  String get cottationSwap => 'assets/icons/cottation_swap.svg';

  /// File path: assets/icons/current_streak.svg
  String get currentStreak => 'assets/icons/current_streak.svg';

  /// File path: assets/icons/daily_excercise.svg
  String get dailyExcercise => 'assets/icons/daily_excercise.svg';

  /// File path: assets/icons/edit.svg
  String get edit => 'assets/icons/edit.svg';

  /// File path: assets/icons/edit_n.svg
  String get editN => 'assets/icons/edit_n.svg';

  /// File path: assets/icons/excercise_completed.svg
  String get excerciseCompleted => 'assets/icons/excercise_completed.svg';

  /// File path: assets/icons/explore.svg
  String get explore => 'assets/icons/explore.svg';

  /// File path: assets/icons/favourites.svg
  String get favourites => 'assets/icons/favourites.svg';

  /// File path: assets/icons/fire.svg
  String get fire => 'assets/icons/fire.svg';

  /// File path: assets/icons/heart.svg
  String get heart => 'assets/icons/heart.svg';

  /// File path: assets/icons/heart_filled.svg
  String get heartFilled => 'assets/icons/heart_filled.svg';

  /// File path: assets/icons/image.svg
  String get image => 'assets/icons/image.svg';

  /// File path: assets/icons/meditation.svg
  String get meditation => 'assets/icons/meditation.svg';

  /// File path: assets/icons/message.svg
  String get message => 'assets/icons/message.svg';

  /// File path: assets/icons/mike.svg
  String get mike => 'assets/icons/mike.svg';

  /// File path: assets/icons/more_vertical.svg
  String get moreVertical => 'assets/icons/more_vertical.svg';

  /// File path: assets/icons/new_journal.svg
  String get newJournal => 'assets/icons/new_journal.svg';

  /// File path: assets/icons/notification.svg
  String get notification => 'assets/icons/notification.svg';

  /// File path: assets/icons/parent_exercises.svg
  String get parentExercises => 'assets/icons/parent_exercises.svg';

  /// File path: assets/icons/parent_home.svg
  String get parentHome => 'assets/icons/parent_home.svg';

  /// File path: assets/icons/parent_journal.svg
  String get parentJournal => 'assets/icons/parent_journal.svg';

  /// File path: assets/icons/parent_murmuration.svg
  String get parentMurmuration => 'assets/icons/parent_murmuration.svg';

  /// File path: assets/icons/play.svg
  String get play => 'assets/icons/play.svg';

  /// File path: assets/icons/sent.svg
  String get sent => 'assets/icons/sent.svg';

  /// File path: assets/icons/settings.svg
  String get settings => 'assets/icons/settings.svg';

  /// File path: assets/icons/star.svg
  String get star => 'assets/icons/star.svg';

  /// File path: assets/icons/success.svg
  String get success => 'assets/icons/success.svg';

  /// File path: assets/icons/tik.svg
  String get tik => 'assets/icons/tik.svg';

  /// File path: assets/icons/trophy.svg
  String get trophy => 'assets/icons/trophy.svg';

  /// List of all assets
  List<String> get values => [
    aiStar,
    bolt,
    cornerUpRight,
    cottation,
    cottationSwap,
    currentStreak,
    dailyExcercise,
    edit,
    editN,
    excerciseCompleted,
    explore,
    favourites,
    fire,
    heart,
    heartFilled,
    image,
    meditation,
    message,
    mike,
    moreVertical,
    newJournal,
    notification,
    parentExercises,
    parentHome,
    parentJournal,
    parentMurmuration,
    play,
    sent,
    settings,
    star,
    success,
    tik,
    trophy,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// File path: assets/images/xp.png
  AssetGenImage get xp => const AssetGenImage('assets/images/xp.png');

  /// List of all assets
  List<AssetGenImage> get values => [user, xp];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
