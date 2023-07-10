import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NuntiumSvgIcon extends StatelessWidget {
  const NuntiumSvgIcon(
    this.assetPath, {
    super.key,
    this.color,
  });

  final String assetPath;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: SvgPicture.asset(
        assetPath,
        height: 24,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      ),
    );
  }
}
