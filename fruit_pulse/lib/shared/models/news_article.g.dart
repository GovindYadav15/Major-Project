// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsArticleImpl _$$NewsArticleImplFromJson(Map<String, dynamic> json) =>
    _$NewsArticleImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      content: json['content'] as String,
      imageUrl: json['imageUrl'] as String,
      category: json['category'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      source: json['source'] as String,
    );

Map<String, dynamic> _$$NewsArticleImplToJson(_$NewsArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'source': instance.source,
    };
