import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon_button.dart';

class NuntiumBackButton extends StatelessWidget {
  const NuntiumBackButton({
    super.key,
    this.iconColor = ColorConstants.greyPrimary,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return NuntiumSvgIconButton(
      onPressed: () => Navigator.pop(context),
      iconPath: NuntiumSVGIconData.arrowLeft,
      iconColor: iconColor,
    );
  }
}
