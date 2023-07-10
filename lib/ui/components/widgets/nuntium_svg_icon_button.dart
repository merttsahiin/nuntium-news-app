import 'package:flutter/material.dart';

import '/ui/components/widgets/nuntium_svg_icon.dart';

class NuntiumSvgIconButton extends StatelessWidget {
  const NuntiumSvgIconButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    this.iconColor,
  });

  final void Function()? onPressed;
  final String iconPath;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: NuntiumSvgIcon(
        iconPath,
        color: iconColor,
      ),
    );
  }
}
