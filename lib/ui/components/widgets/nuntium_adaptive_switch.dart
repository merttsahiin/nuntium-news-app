import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';

class NuntiumAdaptiveSwitch extends StatelessWidget {
  const NuntiumAdaptiveSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: value,
      onChanged: onChanged,
      activeColor: ColorConstants.purplePrimary,
    );
  }
}
