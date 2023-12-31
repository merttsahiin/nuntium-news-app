import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_container.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_elevated_button.dart';
import 'package:nuntium_news_app/ui/screens/main_screen.dart';

class SelectYourFavoriteTopicsScreen extends StatefulWidget {
  const SelectYourFavoriteTopicsScreen({super.key});

  @override
  State<SelectYourFavoriteTopicsScreen> createState() =>
      SselecYyouFfavoritTtopicSscreenState();
}

class SselecYyouFfavoritTtopicSscreenState
    extends State<SelectYourFavoriteTopicsScreen> {
  final String titleText = "Select your favorite topics";
  final String subtitleText =
      "Select some of your favorite topics to let us suggest better news for you.";

  final List<String> topics = categories;
  List<String> selectedTopics = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
          children: [
            Text(titleText, style: NuntiumTextStyles.semibold24),
            const SizedBox(height: SpaceConstants.small),
            Text(subtitleText, style: NuntiumTextStyles.regular16),
            const SizedBox(height: SpaceConstants.xLarge),
            GridView.builder(
              itemCount: topics.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: SpaceConstants.medium,
                crossAxisSpacing: SpaceConstants.medium,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                final topic = topics[index];
                final isSelected = selectedTopics.contains(topic);

                return _TopicContainer(
                  text: topic,
                  isSelected: isSelected,
                  onTap: () {
                    if (isSelected) {
                      selectedTopics.remove(topic);
                    } else {
                      selectedTopics.add(topic);
                    }

                    setState(() {});
                  },
                );
              },
            ),
            const SizedBox(height: SpaceConstants.medium),
            const _NextButton(),
          ],
        ),
      ),
    );
  }
}

class _TopicContainer extends StatelessWidget {
  const _TopicContainer({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final containerColor =
        isSelected ? ColorConstants.purplePrimary : ColorConstants.greyLighter;

    final textColor =
        isSelected ? ColorConstants.white : ColorConstants.greyDarker;

    return NuntiumContainer(
      onTap: onTap,
      color: containerColor,
      child: Center(
        child: Text(
          text,
          style: NuntiumTextStyles.semibold16.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton();

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
      child: const Text("Next"),
    );
  }
}
