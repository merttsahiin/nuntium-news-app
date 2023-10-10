import 'package:flutter/material.dart';
import 'package:nuntium_news_app/core/models/article.dart';

class BookmarksProvider extends ChangeNotifier {
  List<Article> bookmarks = [];

  bool articleIsOnList(Article article) {
    return bookmarks.contains(article);
  }

  void addOrRemoveBookmark(Article article) {
    final isExist = articleIsOnList(article);

    if (isExist) bookmarks.remove(article);
    if (!isExist) bookmarks.add(article);

    notifyListeners();
  }
}
