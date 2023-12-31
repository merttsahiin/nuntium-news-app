import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';

@immutable
final class NuntiumTextStyles {
  const NuntiumTextStyles();

  static TextStyle get regular16 {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ColorConstants.greyPrimary,
    );
  }

  static TextStyle get medium16 {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ColorConstants.blackPrimary,
    );
  }

  static TextStyle get semibold16 {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: ColorConstants.white,
    );
  }

  static TextStyle get semibold24 {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: ColorConstants.blackPrimary,
    );
  }

  static TextStyle get bold20 {
    return const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: ColorConstants.white,
    );
  }
}
