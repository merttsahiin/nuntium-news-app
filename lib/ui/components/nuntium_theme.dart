import 'package:flutter/material.dart';

import '/core/extensions.dart';
import '/constants/color_constants.dart';
import '/ui/components/system_ui_manager.dart';

class NuntiumTheme {
  const NuntiumTheme._();

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
