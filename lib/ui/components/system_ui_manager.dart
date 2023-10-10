import 'package:flutter/services.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';

class SystemUiManager {
  const SystemUiManager._();

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
