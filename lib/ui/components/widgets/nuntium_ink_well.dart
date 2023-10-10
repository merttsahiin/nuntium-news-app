import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';

class NuntiumInkWell extends StatelessWidget {
  const NuntiumInkWell({
    required this.onTap,
    required this.child,
    super.key,
  });

  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: ColorConstants.transparent,
      highlightColor: ColorConstants.transparent,
      child: child,
    );
  }
}
