import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_body_skeleton.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_double_text.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_elevated_button.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_text_field.dart';
import 'package:nuntium_news_app/ui/screens/sign_up_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatNewPasswordController = TextEditingController();

  final String titleText = "Create New Password 🔒";
  final String subtitleText =
      "You can create a new password, please dont forget it too.";

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
              controller: newPasswordController,
              hintText: "New Password",
              prefixIconPath: NuntiumSVGIconData.padlock,
              isPrivate: true,
            ),
            const SizedBox(height: SpaceConstants.medium),
            NuntiumTextField(
              controller: repeatNewPasswordController,
              hintText: "Repeat New Password",
              prefixIconPath: NuntiumSVGIconData.padlock,
              isPrivate: true,
            ),
            const SizedBox(height: SpaceConstants.medium),
            NuntiumElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  NuntiumPageRoutes.defaultRoute<void>(const SignUpScreen()),
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
