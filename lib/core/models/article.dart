import 'user.dart';

class Article {
  final String title;
  final String content;
  final String category;
  final String headerImage;
  final User writer;

  Article({
    required this.title,
    required this.content,
    required this.category,
    required this.headerImage,
    required this.writer,
  });
}
