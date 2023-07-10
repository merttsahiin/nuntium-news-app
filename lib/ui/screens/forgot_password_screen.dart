import 'package:flutter/material.dart';

import 'verification_code_screen.dart';
import '/constants/space_constants.dart';
import '/constants/nuntium_svg_icon_data.dart';
import '/ui/screens/sign_in_screen.dart';
import '/ui/components/widgets/nuntium_text_field.dart';
import '/ui/components/widgets/nuntium_elevated_button.dart';
import '../components/nuntium_page_routes.dart';
import '../components/nuntium_text_styles.dart';
import '../components/widgets/nuntium_double_text.dart';
import '../components/widgets/nuntium_body_skeleton.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  final String titleText = "Forgot Password 🤔";
  final String subtitleText =
      "We need your email adress so we can send you the password reset code.";

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
            NuntiumTextField(
              controller: emailController,
              hintText: "Email Adress",
              prefixIconPath: NuntiumSVGIconData.envelope,
            ),
            const SizedBox(height: SpaceConstants.medium),
            NuntiumElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  NuntiumPageRoutes.defaultRoute(
                    const VerificationCodeScreen(),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              child: const Text("Next"),
            ),
          ],
        ),
        NuntiumDoubleText(
          text1: "Remember the password?",
          text2: "Try again",
          onTap: () {
            Navigator.pushAndRemoveUntil<void>(
              context,
              NuntiumPageRoutes.defaultRoute(const SignInScreen()),
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}
