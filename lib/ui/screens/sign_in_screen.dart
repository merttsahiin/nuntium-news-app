import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/constants/radius_constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_body_skeleton.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_double_text.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_elevated_button.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_ink_well.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_text_field.dart';
import 'package:nuntium_news_app/ui/screens/forgot_password_screen.dart';
import 'package:nuntium_news_app/ui/screens/main_screen.dart';
import 'package:nuntium_news_app/ui/screens/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final String titleText = "Welcome Back 👋";
  final String subtitleText =
      "I am happy to see you again. You can continue where you left off by logging in";

  @override
  Widget build(BuildContext context) {
    return NuntiumBodySkeleton(
      children: [
        Column(
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
            NuntiumTextField(
              controller: passwordController,
              hintText: "Password",
              prefixIconPath: NuntiumSVGIconData.padlock,
              isPrivate: true,
            ),
            const SizedBox(height: SpaceConstants.medium),
            const _ForgotPassword(),
            const SizedBox(height: SpaceConstants.large),
            const _SignInButton(),
          ],
        ),
        Text(
          "or",
          textAlign: TextAlign.center,
          style: NuntiumTextStyles.semibold16.copyWith(
            color: ColorConstants.greyPrimary,
          ),
        ),
        const _SocialMediaButtons(),
        NuntiumDoubleText(
          text1: "Don't have an account?",
          text2: "Sign Up",
          onTap: () {
            Navigator.pushAndRemoveUntil<void>(
              context,
              NuntiumPageRoutes.defaultRoute(const SignUpScreen()),
              (route) => false,
            );
          },
        ),
      ],
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return NuntiumInkWell(
      onTap: () {
        Navigator.of(context).push(
          NuntiumPageRoutes.defaultRoute<void>(const ForgotPasswordScreen()),
        );
      },
      child: Text(
        "Forgot Password?",
        textAlign: TextAlign.end,
        style: NuntiumTextStyles.medium16.copyWith(
          color: ColorConstants.greyPrimary,
        ),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return NuntiumElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil<void>(
          context,
          NuntiumPageRoutes.defaultRoute(const MainScreen()),
          (route) => false,
        );
      },
      padding: EdgeInsets.zero,
      child: const Text("Sign In"),
    );
  }
}

class _SocialMediaButtons extends StatelessWidget {
  const _SocialMediaButtons();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SignInWithSocialMediaButton(
          signInType: _SocialMediaSignInType.google,
        ),
        SizedBox(height: SpaceConstants.medium),
        _SignInWithSocialMediaButton(
          signInType: _SocialMediaSignInType.facebook,
        ),
      ],
    );
  }
}

enum _SocialMediaSignInType { google, facebook }

class _SignInWithSocialMediaButton extends StatelessWidget {
  const _SignInWithSocialMediaButton({required this.signInType});

  final _SocialMediaSignInType signInType;

  @override
  Widget build(BuildContext context) {
    return NuntiumElevatedButton(
      onPressed: () {},
      backgroundColor: ColorConstants.white,
      foregroundColor: ColorConstants.greyDarker,
      overlayColor: ColorConstants.greyLighter,
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: ColorConstants.greyLighter),
        borderRadius: BorderRadius.all(RadiusConstants.circularDefault),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIcon(),
          buildTitle(),
          // SizedBox for center title
          // Same size as icon
          const SizedBox(width: 24),
        ],
      ),
    );
  }

  Widget buildIcon() {
    switch (signInType) {
      case _SocialMediaSignInType.google:
        return const NuntiumSvgIcon(NuntiumSVGIconData.google);
      case _SocialMediaSignInType.facebook:
        return const NuntiumSvgIcon(NuntiumSVGIconData.facebook);
    }
  }

  Widget buildTitle() {
    switch (signInType) {
      case _SocialMediaSignInType.google:
        return const Text("Sign In with Google");
      case _SocialMediaSignInType.facebook:
        return const Text("Sign In with Facebook");
    }
  }
}
