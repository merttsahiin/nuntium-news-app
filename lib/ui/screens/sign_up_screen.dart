import 'package:flutter/material.dart';

import 'select_your_favorite_topics_screen.dart';
import '/ui/screens/sign_in_screen.dart';
import '/constants/space_constants.dart';
import '/constants/nuntium_svg_icon_data.dart';
import '../components/nuntium_page_routes.dart';
import '../components/nuntium_text_styles.dart';
import '../components/widgets/nuntium_text_field.dart';
import '../components/widgets/nuntium_double_text.dart';
import '../components/widgets/nuntium_body_skeleton.dart';
import '../components/widgets/nuntium_elevated_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

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
                  NuntiumPageRoutes.defaultRoute(
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
