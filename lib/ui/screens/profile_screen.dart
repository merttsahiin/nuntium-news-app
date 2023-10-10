import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/core/datas.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_adaptive_switch.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_container.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon.dart';
import 'package:nuntium_news_app/ui/screens/change_password_screen.dart';
import 'package:nuntium_news_app/ui/screens/language_screen.dart';
import 'package:nuntium_news_app/ui/screens/terms_and_conditions_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool notificationsAreEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
          children: [
            Text(
              "Profile",
              style: NuntiumTextStyles.semibold24,
            ),
            const SizedBox(height: SpaceConstants.xLarge),
            const _UserInfo(),
            const SizedBox(height: SpaceConstants.xLarge),
            notificationsButton(),
            const SizedBox(height: SpaceConstants.medium),
            languageButton(),
            const SizedBox(height: SpaceConstants.medium),
            changePasswordButton(),
            const SizedBox(height: SpaceConstants.xLarge),
            privacyButton(),
            const SizedBox(height: SpaceConstants.medium),
            termsAndConditionsButton(),
            const SizedBox(height: SpaceConstants.xLarge),
            signOutButton(),
          ],
        ),
      ),
    );
  }

  _Button notificationsButton() {
    return _Button(
      "Notifications",
      trailing: NuntiumAdaptiveSwitch(
        value: notificationsAreEnabled,
        onChanged: (value) {
          setState(() {
            notificationsAreEnabled = !notificationsAreEnabled;
          });
        },
      ),
    );
  }

  _Button languageButton() {
    return _Button(
      "Language",
      onTap: () {
        Navigator.of(context).push(
          NuntiumPageRoutes.defaultRoute<void>(const LanguageScreen()),
        );
      },
    );
  }

  _Button changePasswordButton() {
    return _Button(
      "Change Password",
      onTap: () {
        Navigator.of(context).push(
          NuntiumPageRoutes.defaultRoute<void>(const ChangePasswordScreen()),
        );
      },
    );
  }

  _Button privacyButton() => const _Button("Privacy");

  _Button termsAndConditionsButton() {
    return _Button(
      "Terms & Conditions",
      onTap: () {
        Navigator.of(context).push(
          NuntiumPageRoutes.defaultRoute<void>(
            const TermsAndConditionsScreen(),
          ),
        );
      },
    );
  }

  _Button signOutButton() {
    return const _Button("Sign Out", iconPath: NuntiumSVGIconData.signout);
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        circularUserPhoto(),
        const SizedBox(width: SpaceConstants.large),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userName(),
            userEmail(),
          ],
        ),
      ],
    );
  }

  Container circularUserPhoto() {
    return Container(
      height: 72,
      width: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(user.photo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Text userName() {
    return Text(
      user.name,
      style: NuntiumTextStyles.semibold16.copyWith(
        color: ColorConstants.blackPrimary,
      ),
    );
  }

  Text userEmail() {
    return Text(
      user.email,
      style: NuntiumTextStyles.regular16.copyWith(
        fontSize: 14,
        color: ColorConstants.greyPrimary,
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
    this.title, {
    this.iconPath,
    this.trailing,
    this.onTap,
  });

  final String title;
  final String? iconPath;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return NuntiumContainer(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpaceConstants.large),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: NuntiumTextStyles.semibold16.copyWith(
                  color: ColorConstants.greyDarker,
                ),
              ),
            ),
            const SizedBox(width: SpaceConstants.medium),
            trailing ??
                NuntiumSvgIcon(
                  iconPath ?? NuntiumSVGIconData.angleRight,
                  color: ColorConstants.greyDarker,
                ),
          ],
        ),
      ),
    );
  }
}
