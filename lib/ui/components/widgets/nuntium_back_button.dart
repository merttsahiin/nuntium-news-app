import 'package:flutter/material.dart';

import 'nuntium_svg_icon_button.dart';
import '/constants/color_constants.dart';
import '/constants/nuntium_svg_icon_data.dart';

class NuntiumBackButton extends StatelessWidget {
  const NuntiumBackButton({
    super.key,
    this.iconColor = ColorConstants.greyPrimary,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return NuntiumSvgIconButton(
      onPressed: () => Navigator.pop(context),
      iconPath: NuntiumSVGIconData.arrowLeft,
      iconColor: iconColor,
    );
  }
}
