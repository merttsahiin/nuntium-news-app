import 'package:flutter/material.dart';
import 'package:nuntium_news_app/constants/color_constants.dart';
import 'package:nuntium_news_app/constants/nuntium_svg_icon_data.dart';
import 'package:nuntium_news_app/core/models/article.dart';
import 'package:nuntium_news_app/core/providers/bookmarks_provider.dart';
import 'package:nuntium_news_app/ui/components/widgets/nuntium_svg_icon_button.dart';
import 'package:provider/provider.dart';

class ArticleBookmarkButton extends StatelessWidget {
  const ArticleBookmarkButton({
    required this.article,
    super.key,
    this.iconColor = ColorConstants.greyPrimary,
  });

  final Article article;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final bookmarksProvider = context.watch<BookmarksProvider>();

    return NuntiumSvgIconButton(
      onPressed: () => bookmarksProvider.addOrRemoveBookmark(article),
      iconColor: iconColor,
      iconPath: bookmarksProvider.articleIsOnList(article)
          ? NuntiumSVGIconData.bookmarkFill
          : NuntiumSVGIconData.bookmark,
    );
  }
}
