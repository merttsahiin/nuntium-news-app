import 'package:flutter/material.dart';

import '/core/models/article.dart';

class BookmarksProvider extends ChangeNotifier {
  List<Article> bookmarks = [];

  bool isOnList(Article article) {
    return bookmarks.contains(article);
  }

  void addOrRemoveBookmark(Article article) {
    final bool isExist = isOnList(article);

    if (isExist) bookmarks.remove(article);
    if (!isExist) bookmarks.add(article);

    notifyListeners();
  }
}
