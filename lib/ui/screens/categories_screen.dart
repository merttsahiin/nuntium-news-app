import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_container.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  static const titleText = "Categories";
  static const subtitleText = "Thousands of articles in each category";

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
              itemCount: categories.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: SpaceConstants.medium,
                crossAxisSpacing: SpaceConstants.medium,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (context, index) {
                final topic = categories[index];

                return NuntiumContainer(
                  color: ColorConstants.white,
                  border: Border.all(color: ColorConstants.greyLighter),
                  child: Center(
                    child: Text(
                      topic,
                      style: NuntiumTextStyles.semibold16.copyWith(
                        color: ColorConstants.greyDarker,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
