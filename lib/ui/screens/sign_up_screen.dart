import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_body_skeleton.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_double_text.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_elevated_button.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_text_field.dart';
import 'package:nuntium_news_app/ui/screens/select_your_favorite_topics_screen.dart';
import 'package:nuntium_news_app/ui/screens/sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  final String titleText = "Welcome to Nuntium 👋";
  final String subtitleText =
      "Hello, I guess you are new around here. You can start using the application after sign up.";

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
              controller: usernameController,
              hintText: "Username",
              prefixIconPath: NuntiumSVGIconData.user,
            ),
            const SizedBox(height: SpaceConstants.medium),
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
            NuntiumTextField(
              controller: repeatPasswordController,
              hintText: "Repeat New Password",
              prefixIconPath: NuntiumSVGIconData.padlock,
              isPrivate: true,
            ),
            const SizedBox(height: SpaceConstants.medium),
            NuntiumElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  NuntiumPageRoutes.defaultRoute<void>(
                    const SelectYourFavoriteTopicsScreen(),
                  ),
                );
              },
              padding: EdgeInsets.zero,
              child: const Text("Sign Up"),
            ),
          ],
        ),
        NuntiumDoubleText(
          text1: "Already have an account?",
          text2: "Sign In",
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
