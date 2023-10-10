import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/core/extensions/color_extensions.dart';
import 'package:nuntium_news_app/ui/components/system_ui_manager.dart';

@immutable
final class AppTheme {
  const AppTheme();

  static ThemeData theme = ThemeData(
    primarySwatch: ColorConstants.purplePrimary.toMaterialColor,
    scaffoldBackgroundColor: ColorConstants.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: ColorConstants.transparent,
      systemOverlayStyle: SystemUiManager.setStatusBarDarkIconBrightness,
    ),
  );
}
