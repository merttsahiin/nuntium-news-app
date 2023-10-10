import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/radius_constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';

class NuntiumElevatedButton extends StatelessWidget {
  const NuntiumElevatedButton({
    required this.onPressed,
    required this.child,
    super.key,
    this.padding,
    this.backgroundColor = ColorConstants.purplePrimary,
    this.foregroundColor = ColorConstants.white,
    this.overlayColor = ColorConstants.purpleDarker,
    this.height = 56,
    this.width = double.maxFinite,
    this.shape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(RadiusConstants.circularDefault),
    ),
  });

  final void Function()? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color overlayColor;
  final double height;
  final double width;
  final OutlinedBorder shape;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: SpaceConstants.defaultSpace),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          splashFactory: NoSplash.splashFactory,
          backgroundColor: MaterialStatePropertyAll(backgroundColor),
          foregroundColor: MaterialStatePropertyAll(foregroundColor),
          overlayColor: MaterialStatePropertyAll(overlayColor),
          fixedSize: MaterialStatePropertyAll(
            Size(width, height),
          ),
          shape: MaterialStatePropertyAll(shape),
        ),
        child: child,
      ),
    );
  }
}
