import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/models/article.dart';
import '/core/providers/bookmarks_provider.dart';
import '/constants/color_constants.dart';
import '/constants/nuntium_svg_icon_data.dart';
import '/ui/components/widgets/nuntium_svg_icon_button.dart';

class ArticleBookmarkButton extends StatelessWidget {
  const ArticleBookmarkButton({
    super.key,
    required this.article,
    this.iconColor = ColorConstants.greyPrimary,
  });

  final Article article;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    BookmarksProvider bookmarksProvider = context.watch<BookmarksProvider>();

    return NuntiumSvgIconButton(
      onPressed: () {
        bookmarksProvider.addOrRemoveBookmark(article);
      },
      iconColor: iconColor,
      iconPath: bookmarksProvider.isOnList(article)
          ? NuntiumSVGIconData.bookmarkFill
          : NuntiumSVGIconData.bookmark,
    );
  }
}
