import 'package:flutter/material.dart';

import '/core/models/article.dart';
import '/constants/color_constants.dart';
import '/constants/space_constants.dart';
import '/constants/radius_constants.dart';
import '/constants/nuntium_svg_icon_data.dart';
import '/ui/components/nuntium_text_styles.dart';
import '/ui/components/widgets/nuntium_back_button.dart';
import '/ui/components/widgets/nuntium_elevated_button.dart';
import '/ui/components/widgets/nuntium_svg_icon_button.dart';
import '../components/widgets/article_bookmark_button.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key, required this.article});

  final Article article;

  final double headerHeight = 384.0;
  final Radius radius = RadiusConstants.circularLarge;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: body(statusBarHeight),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: const NuntiumBackButton(
        iconColor: ColorConstants.white,
      ),
      actions: [
        ArticleBookmarkButton(
          article: article,
          iconColor: ColorConstants.white,
        ),
        NuntiumSvgIconButton(
          onPressed: () {},
          iconPath: NuntiumSVGIconData.share,
          iconColor: ColorConstants.white,
        ),
      ],
    );
  }

  Stack body(double statusBarHeight) {
    return Stack(
      children: [
        _Header(
          article: article,
          headerHeight: headerHeight,
          radius: radius,
        ),
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Header'ın gözükebilmesi için
            SizedBox(
              height: headerHeight -
                  statusBarHeight -
                  radius.x -
                  AppBar().preferredSize.height,
            ),
            _ContentContainer(
              radius: radius,
              article: article,
            ),
          ],
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.article,
    required this.headerHeight,
    required this.radius,
  });

  final Article article;
  final double headerHeight;
  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _HeaderImage(
          article: article,
          headerHeight: headerHeight,
        ),
        _HeaderComponents(
          article: article,
          headerHeight: headerHeight,
          radius: radius,
        ),
      ],
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({
    required this.article,
    required this.headerHeight,
  });

  final Article article;
  final double headerHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(article.headerImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _HeaderComponents extends StatelessWidget {
  const _HeaderComponents({
    required this.article,
    required this.headerHeight,
    required this.radius,
  });

  final Article article;
  final double headerHeight;
  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: headerHeight - radius.x,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(
              SpaceConstants.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _HeaderArticleCategoryButton(
                  article: article,
                ),
                const SizedBox(height: SpaceConstants.medium),
                _HeaderArticleTitle(article: article),
                const SizedBox(height: SpaceConstants.large),
                _HeaderArticleWriter(article: article),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderArticleCategoryButton extends StatelessWidget {
  const _HeaderArticleCategoryButton({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return NuntiumElevatedButton(
      onPressed: null,
      height: double.nan,
      width: double.nan,
      padding: EdgeInsets.zero,
      backgroundColor: ColorConstants.purplePrimary,
      foregroundColor: ColorConstants.white,
      overlayColor: ColorConstants.purpleDarker,
      shape: const StadiumBorder(),
      child: Text(article.category),
    );
  }
}

class _HeaderArticleTitle extends StatelessWidget {
  const _HeaderArticleTitle({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Text(
      article.title,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
      style: NuntiumTextStyles.bold20,
    );
  }
}

class _HeaderArticleWriter extends StatelessWidget {
  const _HeaderArticleWriter({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(
                article.writer.photo,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: SpaceConstants.medium),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.writer.name,
              style: NuntiumTextStyles.semibold16,
            ),
            Text(
              article.writer.role,
              style: NuntiumTextStyles.regular16.copyWith(
                fontSize: 14,
                color: ColorConstants.greyLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ContentContainer extends StatelessWidget {
  const _ContentContainer({required this.radius, required this.article});

  final Article article;
  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.white,
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Results",
              style: NuntiumTextStyles.semibold16.copyWith(
                color: ColorConstants.blackPrimary,
              ),
            ),
            const SizedBox(height: SpaceConstants.small),
            Text(
              article.content * 100,
              style: NuntiumTextStyles.regular16.copyWith(
                color: ColorConstants.greyDarker,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
