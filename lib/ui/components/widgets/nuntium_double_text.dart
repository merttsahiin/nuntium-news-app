import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_ink_well.dart';

class NuntiumDoubleText extends StatelessWidget {
  const NuntiumDoubleText({
    required this.text1,
    required this.text2,
    required this.onTap,
    super.key,
  });

  final String text1;
  final String text2;
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
