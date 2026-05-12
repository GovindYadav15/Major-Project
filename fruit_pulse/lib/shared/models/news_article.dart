import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_article.freezed.dart';
part 'news_article.g.dart';

@freezed
class NewsArticle with _$NewsArticle {
  const factory NewsArticle({
    required String id,
    required String title,
    required String description,
    required String content,
    required String imageUrl,
    required String category,
    required DateTime publishedAt,
    required String source,
  }) = _NewsArticle;

  factory NewsArticle.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleFromJson(json);
}
