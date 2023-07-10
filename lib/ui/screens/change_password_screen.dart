import 'package:flutter/material.dart';

import '/constants/space_constants.dart';
import '/constants/nuntium_svg_icon_data.dart';
import '../components/nuntium_text_styles.dart';
import '../components/widgets/nuntium_text_field.dart';
import '../components/widgets/nuntium_back_button.dart';
import '../components/widgets/nuntium_elevated_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController repeatNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NuntiumBackButton(),
        title: Text(
          "Change Password",
          style: NuntiumTextStyles.semibold24,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
        children: [
          NuntiumTextField(
            controller: currentPasswordController,
            hintText: "Current Password",
            prefixIconPath: NuntiumSVGIconData.padlock,
          ),
          const SizedBox(height: SpaceConstants.medium),
          NuntiumTextField(
            controller: newPasswordController,
            hintText: "New Password",
            prefixIconPath: NuntiumSVGIconData.padlock,
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
            onPressed: () {},
            padding: EdgeInsets.zero,
            child: const Text("Change Password"),
          ),
        ],
      ),
    );
  }
}