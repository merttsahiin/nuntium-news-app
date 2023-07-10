import 'package:flutter/material.dart';

import '/constants/space_constants.dart';
import '/constants/color_constants.dart';
import '/ui/components/nuntium_text_styles.dart';
import '/ui/components/widgets/nuntium_ink_well.dart';

class NuntiumDoubleText extends StatelessWidget {
  const NuntiumDoubleText({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  final String text1, text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: NuntiumTextStyles.medium16.copyWith(
            color: ColorConstants.blackLighter,
          ),
        ),
        const SizedBox(width: SpaceConstants.small),
        NuntiumInkWell(
          onTap: onTap,
          child: Text(
            text2,
            style: NuntiumTextStyles.medium16.copyWith(
              color: ColorConstants.blackDarker,
            ),
          ),
        ),
      ],
    );
  }
}
