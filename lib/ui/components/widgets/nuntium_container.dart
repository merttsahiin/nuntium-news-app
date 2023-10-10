import 'package:flutter/material.dart';

import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/radius_constants.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_ink_well.dart';

class NuntiumContainer extends StatelessWidget {
  const NuntiumContainer({
    required this.child,
    super.key,
    this.height = 56,
    this.width = double.infinity,
    this.color = ColorConstants.greyLighter,
    this.border,
    this.onTap,
  });

  final Widget child;
  final double height;
  final double width;
  final Color color;
  final BoxBorder? border;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return NuntiumInkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: const BorderRadius.all(
            RadiusConstants.circularDefault,
          ),
        ),
        child: child,
      ),
    );
  }
}
