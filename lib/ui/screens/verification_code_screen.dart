import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'create_new_password_screen.dart';
import '/constants/color_constants.dart';
import '/constants/space_constants.dart';
import '/constants/radius_constants.dart';
import '../components/nuntium_page_routes.dart';
import '../components/nuntium_text_styles.dart';
import '../components/widgets/nuntium_double_text.dart';
import '../components/widgets/nuntium_body_skeleton.dart';
import '../components/widgets/nuntium_elevated_button.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  final String titleText = "Verification Code ✅";
  final String subtitleText =
      "You need to enter 4-digit code we send to your email adress.";

  @override
  Widget build(BuildContext context) {
    return NuntiumBodySkeleton(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(titleText, style: NuntiumTextStyles.semibold24),
            const SizedBox(height: SpaceConstants.small),
            Text(subtitleText, style: NuntiumTextStyles.regular16),
            const SizedBox(height: SpaceConstants.xLarge),
            const _VerificationPinput(),
            const SizedBox(height: SpaceConstants.medium),
            NuntiumElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  NuntiumPageRoutes.defaultRoute(
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
