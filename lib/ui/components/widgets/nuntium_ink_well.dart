import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

class NuntiumInkWell extends StatelessWidget {
  const NuntiumInkWell({
    super.key,
    required this.onTap,
    required this.child,
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
