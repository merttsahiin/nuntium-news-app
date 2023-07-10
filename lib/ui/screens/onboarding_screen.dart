import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'welcome_screen.dart';
import '/constants/space_constants.dart';
import '/constants/color_constants.dart';
import '/constants/image_constants.dart';
import '/constants/radius_constants.dart';
import '/ui/components/nuntium_text_styles.dart';
import '../components/nuntium_page_routes.dart';
import '../components/widgets/nuntium_elevated_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activePageIndex = 1;
  CarouselController carouselController = CarouselController();

  final List<Widget> items = const [
    _CarouselSliderItem(imagePath: ImageConstants.image1),
    _CarouselSliderItem(imagePath: ImageConstants.image1),
    _CarouselSliderItem(imagePath: ImageConstants.image1),
  ];

  final String titleText = "First to know";
  final String subtitleText =
      "All news in one place, be the first to know last news";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            sliderAndIndicator(),
            titleAndSubtitle(),
            nextButton(),
          ],
        ),
      ),
    );
  }

  Column sliderAndIndicator() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CarouselSlider(
          items: items,
          carouselController: carouselController,
          options: CarouselOptions(
            initialPage: 1,
            height: 336,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            onPageChanged: (index, reason) {
              setState(() => activePageIndex = index);
            },
          ),
        ),
        const SizedBox(height: SpaceConstants.defaultSpace),
        _CarouselSliderIndicator(
          length: items.length,
          activeIndex: activePageIndex,
          controller: carouselController,
        ),
      ],
    );
  }

  Column titleAndSubtitle() {
    return Column(
      children: [
        Text(
          titleText,
          textAlign: TextAlign.center,
          style: NuntiumTextStyles.semibold24,
        ),
        const SizedBox(height: SpaceConstants.defaultSpace),
        Text(
          subtitleText,
          textAlign: TextAlign.center,
          style: NuntiumTextStyles.regular16,
        ),
      ],
    );
  }

  NuntiumElevatedButton nextButton() {
    return NuntiumElevatedButton(
      onPressed: () async {
        if (activePageIndex + 1 == items.length) {
          Navigator.pushAndRemoveUntil<void>(
            context,
            NuntiumPageRoutes.defaultRoute(const WelcomeScreen()),
            (route) => false,
          );

          return;
        }

        await carouselController.nextPage();
      },
      child: Text("Next", style: NuntiumTextStyles.semibold16),
    );
  }
}

class _CarouselSliderItem extends StatelessWidget {
  const _CarouselSliderItem({required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(RadiusConstants.circularDefault),
      ),
    );
  }
}

class _CarouselSliderIndicator extends StatelessWidget {
  const _CarouselSliderIndicator({
    required this.length,
    required this.activeIndex,
    required this.controller,
  });

  final int length;
  final int activeIndex;
  final CarouselController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildItem(index),
              buildSeperator(index),
            ],
          );
        },
      ),
    );
  }

  Widget buildItem(int index) {
    bool isActive = index == activeIndex;
    return Container(
      height: 8,
      width: isActive ? 24 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? ColorConstants.purplePrimary
            : ColorConstants.greyLighter,
        borderRadius: const BorderRadius.all(
          RadiusConstants.circularSmall,
        ),
      ),
    );
  }

  Widget buildSeperator(int index) {
    return index != length - 1
        ? const SizedBox(width: SpaceConstants.small)
        : const SizedBox();
  }
}
