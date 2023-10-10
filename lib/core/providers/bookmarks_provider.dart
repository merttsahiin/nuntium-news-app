import 'package:flutter/material.dart';
import 'package:nuntium_news_app/core/models/article.dart';

class BookmarksProvider extends ChangeNotifier {
  List<Article> bookmarks = [];

  bool isOnList(Article article) {
    return bookmarks.contains(article);
  }

  void addOrRemoveBookmark(Article article) {
    final isExist = isOnList(article);

    if (isExist) bookmarks.remove(article);
    if (!isExist) bookmarks.add(article);

    notifyListeners();
  }
}
