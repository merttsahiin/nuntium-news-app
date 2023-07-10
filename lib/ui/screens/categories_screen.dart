import 'package:flutter/material.dart';

import '/constants/constants.dart';
import '/constants/color_constants.dart';
import '/constants/space_constants.dart';
import '../components/nuntium_text_styles.dart';
import '../components/widgets/nuntium_container.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final String titleText = "Categories";
  final String subtitleText = "Thousands of articles in each category";

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
                String topic = categories[index];

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
