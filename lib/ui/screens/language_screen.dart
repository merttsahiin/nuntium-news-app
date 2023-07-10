import 'package:flutter/material.dart';

import '/constants/constants.dart';
import '/constants/color_constants.dart';
import '/constants/space_constants.dart';
import '/constants/nuntium_svg_icon_data.dart';
import '/ui/components/nuntium_text_styles.dart';
import '/ui/components/widgets/nuntium_svg_icon.dart';
import '/ui/components/widgets/nuntium_container.dart';
import '../components/widgets/nuntium_back_button.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late String selectedLanguage;

  final String appBarTitle = "Language";

  @override
  void initState() {
    super.initState();

    selectedLanguage = supportedLanguages.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: const NuntiumBackButton(),
      title: Text(
        appBarTitle,
        style: NuntiumTextStyles.semibold24,
      ),
    );
  }

  ListView body() {
    return ListView.separated(
      itemCount: supportedLanguages.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
      itemBuilder: (context, index) {
        final String language = supportedLanguages[index];

        return _LanguageButton(
          language: language,
          isSelected: language == selectedLanguage,
          onTap: () {
            setState(() => selectedLanguage = language);
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: SpaceConstants.medium);
      },
    );
  }
}

class _LanguageButton extends StatelessWidget {
  const _LanguageButton({
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  final String language;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return NuntiumContainer(
      onTap: onTap,
      color: isSelected
          ? ColorConstants.purplePrimary
          : ColorConstants.greyLighter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SpaceConstants.large,
        ),
        child: Row(
          children: [
            buildLanguageText(),
            buildSeperator(),
            buildCheckIcon(),
          ],
        ),
      ),
    );
  }

  Expanded buildLanguageText() {
    return Expanded(
      child: Text(
        language,
        style: NuntiumTextStyles.semibold16.copyWith(
          color: isSelected ? ColorConstants.white : ColorConstants.greyDarker,
        ),
      ),
    );
  }

  Widget buildSeperator() {
    return isSelected
        ? const SizedBox(width: SpaceConstants.medium)
        : const SizedBox();
  }

  Widget buildCheckIcon() {
    return isSelected
        ? const NuntiumSvgIcon(
            NuntiumSVGIconData.check,
            color: ColorConstants.white,
          )
        : const SizedBox();
  }
}
