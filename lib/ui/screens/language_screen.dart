import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/constants.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_back_button.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_container.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon.dart';

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
        final language = supportedLanguages[index];

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
    if (!isSelected) return const SizedBox();

    return const SizedBox(width: SpaceConstants.medium);
  }

  Widget buildCheckIcon() {
    if (!isSelected) return const SizedBox();

    return const NuntiumSvgIcon(
      NuntiumSVGIconData.check,
      color: ColorConstants.white,
    );
  }
}
