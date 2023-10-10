import 'package:nuntium_news_app/core/models/user.dart';

class Article {
  Article({
    required this.title,
    required this.content,
    required this.category,
    required this.headerImage,
    required this.writer,
  });

  final String title;
  final String content;
  final String category;
  final String headerImage;
  final User writer;
}
