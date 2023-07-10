import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

class NuntiumAdaptiveSwitch extends StatelessWidget {
  const NuntiumAdaptiveSwitch({
    super.key,
    required this.value,
    required this.onChanged,
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
