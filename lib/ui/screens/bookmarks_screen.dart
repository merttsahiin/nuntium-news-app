import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/constants/radius_constants.dart';
import 'package:nuntium_news_app/constants/space_constants.dart';
import 'package:nuntium_news_app/core/models/article.dart';
import 'package:nuntium_news_app/core/providers/bookmarks_provider.dart';
import 'package:nuntium_news_app/ui/components/nuntium_page_routes.dart';
import 'package:nuntium_news_app/ui/components/nuntium_text_styles.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_ink_well.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon.dart';
import 'package:nuntium_news_app/ui/screens/article_screen.dart';
import 'package:provider/provider.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookmarksProvider = context.watch<BookmarksProvider>();
    final bookmarks = bookmarksProvider.bookmarks;
    final haveBookmark = bookmarks.isNotEmpty;

    return Scaffold(
      body: SafeArea(
        child: haveBookmark
            ? _BookmarksBody(bookmarks: bookmarks)
            : const _BookmarksEmptyBody(),
      ),
    );
  }
}

class _HeaderTitle extends StatelessWidget {
  const _HeaderTitle();

  static const _titleText = "Bookmarks";
  static const _subtitleText = "Saved articles to the library";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(_titleText, style: NuntiumTextStyles.semibold24),
        const SizedBox(height: SpaceConstants.small),
        Text(_subtitleText, style: NuntiumTextStyles.regular16),
        const SizedBox(height: SpaceConstants.xLarge),
      ],
    );
  }
}

class _BookmarksBody extends StatelessWidget {
  const _BookmarksBody({required this.bookmarks});

  final List<Article> bookmarks;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
      children: [
        const _HeaderTitle(),
        ListView.separated(
          itemCount: bookmarks.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final article = bookmarks[index];

            return _BookmarkItemContainer(article: article);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: SpaceConstants.medium);
          },
        ),
      ],
    );
  }
}

class _BookmarkItemContainer extends StatelessWidget {
  const _BookmarkItemContainer({required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return NuntiumInkWell(
      onTap: () {
        Navigator.of(context).push(
          NuntiumPageRoutes.defaultRoute<void>(ArticleScreen(article: article)),
        );
      },
      child: SizedBox(
        height: 96,
        child: Row(
          children: [
            Container(
              height: 96,
              width: 96,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  RadiusConstants.circularDefault,
                ),
                image: DecorationImage(
                  image: AssetImage(article.headerImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: SpaceConstants.medium),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: NuntiumTextStyles.regular16.copyWith(
                      fontSize: 14,
                      color: ColorConstants.greyPrimary,
                    ),
                  ),
                  const SizedBox(height: SpaceConstants.small),
                  Text(
                    article.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: NuntiumTextStyles.semibold16.copyWith(
                      color: ColorConstants.blackPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookmarksEmptyBody extends StatelessWidget {
  const _BookmarksEmptyBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SpaceConstants.defaultSpace),
      child: Column(
        children: [
          const _HeaderTitle(),
          Expanded(
            child: Center(
              child: UnconstrainedBox(
                child: Container(
                  width: 256,
                  color: ColorConstants.transparent,
                  child: Column(
                    children: [
                      Container(
                        height: 72,
                        width: 72,
                        decoration: const BoxDecoration(
                          color: ColorConstants.greyLighter,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: NuntiumSvgIcon(
                            NuntiumSVGIconData.bookAlt,
                          ),
                        ),
                      ),
                      const SizedBox(height: SpaceConstants.large),
                      Text(
                        "You haven't saved any articles yet. Start reading and bookmarking them now",
                        textAlign: TextAlign.center,
                        style: NuntiumTextStyles.medium16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
