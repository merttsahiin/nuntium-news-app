import 'package:flutter/material.dart' show immutable;
import 'package:flutter/services.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';

@immutable
final class SystemUiManager {
  const SystemUiManager();

  static const SystemUiOverlayStyle setStatusBarLightIconBrightness =
      SystemUiOverlayStyle(
    statusBarColor: ColorConstants.transparent,
    systemNavigationBarColor: ColorConstants.purplePrimary,
    statusBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle setStatusBarDarkIconBrightness =
      SystemUiOverlayStyle(
    statusBarColor: ColorConstants.transparent,
    systemNavigationBarColor: ColorConstants.white,
    statusBarIconBrightness: Brightness.dark,
  );
}
