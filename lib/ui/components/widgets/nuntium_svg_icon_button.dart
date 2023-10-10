import 'package:flutter/material.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon.dart';

class NuntiumSvgIconButton extends StatelessWidget {
  const NuntiumSvgIconButton({
    required this.onPressed,
    required this.iconPath,
    super.key,
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
