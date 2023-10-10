import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/radius_constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_body_skeleton.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_double_text.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_elevated_button.dart';
import 'package:nuntium_news_app/ui/screens/create_new_password_screen.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  static const _titleText = "Verification Code ✅";
  static const _subtitleText =
      "You need to enter 4-digit code we send to your email adress.";

  @override
  Widget build(BuildContext context) {
    return NuntiumBodySkeleton(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(_titleText, style: NuntiumTextStyles.semibold24),
            const SizedBox(height: SpaceConstants.small),
            Text(_subtitleText, style: NuntiumTextStyles.regular16),
            const SizedBox(height: SpaceConstants.xLarge),
            const _VerificationPinput(),
            const SizedBox(height: SpaceConstants.medium),
            NuntiumElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  NuntiumPageRoutes.defaultRoute<void>(
                    const CreateNewPasswordScreen(),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              child: const Text("Confirm"),
            ),
          ],
        ),
        NuntiumDoubleText(
          text1: "Didn’t receive an email?",
          text2: "Send again",
          onTap: () {},
        ),
      ],
    );
  }
}

class _VerificationPinput extends StatelessWidget {
  const _VerificationPinput();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 72,
      height: 72,
      textStyle: NuntiumTextStyles.semibold16.copyWith(
        color: ColorConstants.blackPrimary,
      ),
      decoration: const BoxDecoration(
        color: ColorConstants.greyLighter,
        borderRadius: BorderRadius.all(RadiusConstants.circularDefault),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: ColorConstants.white,
      border: Border.all(color: ColorConstants.purplePrimary),
    );

    final submittedPinTheme = defaultPinTheme;

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: (pin) {},
    );
  }
}
