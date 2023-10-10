import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/image_constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_elevated_button.dart';
import 'package:nuntium_news_app/ui/screens/sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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

  static const _titleText = "Nuntium";
  static const _subtitleText =
      "All news in one place, be the first to know last news";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titleText,
          textAlign: TextAlign.center,
          style: NuntiumTextStyles.semibold24,
        ),
        const SizedBox(height: SpaceConstants.defaultSpace),
        Text(
          _subtitleText,
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
