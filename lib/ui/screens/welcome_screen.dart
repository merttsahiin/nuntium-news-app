import 'package:flutter/material.dart';

import 'sign_in_screen.dart';
import '/constants/image_constants.dart';
import '/constants/space_constants.dart';
import '../components/nuntium_page_routes.dart';
import '../components/nuntium_text_styles.dart';
import '../components/widgets/nuntium_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _WelcomeImage(),
            _WelcomeTitleAndSubtitle(),
            _GetStartedButton(),
          ],
        ),
      ),
    );
  }
}

class _WelcomeImage extends StatelessWidget {
  const _WelcomeImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageConstants.handshake,
      height: 272,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _WelcomeTitleAndSubtitle extends StatelessWidget {
  const _WelcomeTitleAndSubtitle();

  final String titleText = "Nuntium";
  final String subtitleText =
      "All news in one place, be the first to know last news";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleText,
          textAlign: TextAlign.center,
          style: NuntiumTextStyles.semibold24,
        ),
        const SizedBox(height: SpaceConstants.defaultSpace),
        Text(
          subtitleText,
          textAlign: TextAlign.center,
          style: NuntiumTextStyles.regular16,
        ),
      ],
    );
  }
}

class _GetStartedButton extends StatelessWidget {
  const _GetStartedButton();

  @override
  Widget build(BuildContext context) {
    return NuntiumElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil<void>(
          context,
          NuntiumPageRoutes.defaultRoute(const SignInScreen()),
          (route) => false,
        );
      },
      child: Text("Get Started", style: NuntiumTextStyles.semibold16),
    );
  }
}
