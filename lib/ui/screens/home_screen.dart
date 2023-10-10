import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/constants.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/constants/radius_constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/core/datas.dart';
import 'package:nuntium_news_app/core/models/article.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/article_bookmark_button.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_elevated_button.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_ink_well.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_text_field.dart';
import 'package:nuntium_news_app/ui/screens/article_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _TitleSubtitleAndSearchField(searchController: searchController),
          const _HorizontalCategorieButtons(),
          const _ArticlesListView(),
        ],
      ),
    );
  }
}

class _TitleSubtitleAndSearchField extends StatelessWidget {
  const _TitleSubtitleAndSearchField({required this.searchController});

  final TextEditingController searchController;

  static const titleText = "Browse";
  static const subtitleText = "Discover things of this world";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(titleText, style: NuntiumTextStyles.semibold24),
          const SizedBox(height: SpaceConstants.small),
          Text(subtitleText, style: NuntiumTextStyles.regular16),
          const SizedBox(height: SpaceConstants.xLarge),
          NuntiumTextField(
            controller: searchController,
            hintText: "Search",
            prefixIconPath: NuntiumSVGIconData.search,
            suffixIcon: const NuntiumSvgIcon(
              NuntiumSVGIconData.microphone,
              color: ColorConstants.greyPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _HorizontalCategorieButtons extends StatefulWidget {
  const _HorizontalCategorieButtons();

  @override
  State<_HorizontalCategorieButtons> createState() =>
      _HorizontalCategorieButtonsState();
}

class _HorizontalCategorieButtonsState
    extends State<_HorizontalCategorieButtons> {
  int selectedCategorieIndex = 0;

  final double height = 35;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: SpaceConstants.defaultSpace,
        ),
        itemBuilder: (context, index) {
          final backgroundColor = selectedCategorieIndex == index
              ? ColorConstants.purplePrimary
              : ColorConstants.greyLighter;

          final foregroundColor = selectedCategorieIndex == index
              ? ColorConstants.white
              : ColorConstants.greyPrimary;

          return NuntiumElevatedButton(
            onPressed: () {
              setState(() => selectedCategorieIndex = index);
            },
            height: height,
            width: double.nan,
            padding: EdgeInsets.zero,
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            overlayColor: ColorConstants.purpleDarker,
            shape: const StadiumBorder(),
            child: Text(categories[index]),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: SpaceConstants.medium);
        },
      ),
    );
  }
}

class _ArticlesListView extends StatelessWidget {
  const _ArticlesListView();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final article = articles[index];

        return _ArticleContainer(article: article);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: SpaceConstants.large);
      },
    );
  }
}

class _ArticleContainer extends StatelessWidget {
  const _ArticleContainer({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return NuntiumInkWell(
      onTap: () {
        Navigator.of(context).push(
          NuntiumPageRoutes.defaultRoute<void>(ArticleScreen(article: article)),
        );
      },
      child: Container(
        height: 272,
        decoration: BoxDecoration(
          border: Border.all(color: ColorConstants.greyLighter),
          borderRadius: const BorderRadius.all(
            RadiusConstants.circularDefault,
          ),
        ),
        child: Column(
          children: [
            articleImage(),
            articleTitleAndArticleBookmarkButton(),
          ],
        ),
      ),
    );
  }

  Container articleImage() {
    return Container(
      height: 192,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: RadiusConstants.circularDefault,
          topRight: RadiusConstants.circularDefault,
        ),
        image: DecorationImage(
          image: AssetImage(
            article.headerImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Expanded articleTitleAndArticleBookmarkButton() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(SpaceConstants.medium),
        child: Row(
          children: [
            articleTitle(),
            const SizedBox(width: SpaceConstants.medium),
            articleBookmarkButton(),
          ],
        ),
      ),
    );
  }

  Expanded articleTitle() {
    return Expanded(
      child: Text(
        article.title,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: NuntiumTextStyles.semibold16.copyWith(
          color: ColorConstants.blackPrimary,
        ),
      ),
    );
  }

  ArticleBookmarkButton articleBookmarkButton() {
    return ArticleBookmarkButton(article: article);
  }
}
