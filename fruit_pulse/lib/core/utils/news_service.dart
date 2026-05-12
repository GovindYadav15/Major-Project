import 'dart:convert';

import 'package:dio/dio.dart';

import '../../shared/models/news_article.dart';

class NewsService {
  NewsService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.gdeltproject.org/api/v2/doc',
          connectTimeout: const Duration(seconds: 12),
          receiveTimeout: const Duration(seconds: 12),
        ),
      );

  final Dio _dio;

  static const List<String> _categories = [
    'All',
    'Apple',
    'Banana',
    'Tomato',
    'Strawberry',
    'Mango',
    'Vegetables',
  ];

  static const Map<String, String> _categoryQueries = {
    'Apple': 'apple fruit harvest produce',
    'Banana': 'banana fruit harvest produce',
    'Tomato': 'tomato vegetable harvest produce',
    'Strawberry': 'strawberry fruit harvest produce',
    'Mango': 'mango fruit harvest produce',
    'Vegetables': 'vegetable produce farming harvest',
  };

  static const Map<String, String> _fallbackImages = {
    'Apple': 'https://images.unsplash.com/photo-1560806887-1e4cd0b6cbd6?w=800',
    'Banana':
        'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?w=800',
    'Tomato': 'https://images.unsplash.com/photo-1546094096-0df4bcaaa337?w=800',
    'Strawberry':
        'https://images.unsplash.com/photo-1464965911861-746a04b4bca6?w=800',
    'Mango': 'https://images.unsplash.com/photo-1553279768-865429fa0078?w=800',
    'Vegetables':
        'https://images.unsplash.com/photo-1540420773420-3366772f4999?w=800',
  };

  Future<List<NewsArticle>> fetchNews({String? category}) async {
    final selectedCategory = category == null || category == 'All'
        ? 'All'
        : category;
    final response = await _dio.get<Map<String, dynamic>>(
      '/doc',
      queryParameters: {
        'query': _buildQuery(selectedCategory),
        'mode': 'artlist',
        'format': 'json',
        'maxrecords': 20,
        'timespan': '1month',
        'sort': 'datedesc',
      },
    );

    final articles = response.data?['articles'];
    if (articles is! List) {
      return [];
    }

    return articles
        .whereType<Map<String, dynamic>>()
        .map((article) => _mapArticle(article, selectedCategory))
        .where((article) => article.title.isNotEmpty)
        .toList();
  }

  List<String> getCategories() => _categories;

  String _buildQuery(String category) {
    final categoryQuery = _categoryQueries[category];
    if (categoryQuery != null) {
      return '$categoryQuery sourcelang:english';
    }

    return '(fruit OR vegetable OR "fresh produce" OR "produce market" OR '
        '"crop harvest") sourcelang:english';
  }

  NewsArticle _mapArticle(Map<String, dynamic> json, String selectedCategory) {
    final url = _stringValue(json['url']);
    final title = _cleanText(_stringValue(json['title']));
    final source = _stringValue(json['domain'], fallback: 'GDELT News');
    final category = selectedCategory == 'All'
        ? _inferCategory(title)
        : selectedCategory;
    final description = _buildDescription(title, source);

    return NewsArticle(
      id: base64Url.encode(utf8.encode(url.isEmpty ? title : url)),
      title: title,
      description: description,
      content: '$description\n\nRead the complete story from $source.',
      imageUrl: _imageUrl(json, category),
      category: category,
      publishedAt: _parseSeenDate(_stringValue(json['seendate'])),
      source: source,
    );
  }

  String _imageUrl(Map<String, dynamic> json, String category) {
    final image = _stringValue(json['socialimage']);
    if (image.startsWith('http')) {
      return image;
    }

    return _fallbackImages[category] ?? _fallbackImages['Vegetables']!;
  }

  String _inferCategory(String text) {
    final lowerText = text.toLowerCase();
    for (final category in _categories.skip(1)) {
      if (lowerText.contains(category.toLowerCase())) {
        return category;
      }
    }

    return 'Vegetables';
  }

  String _buildDescription(String title, String source) {
    if (title.isEmpty) {
      return 'Fresh fruit and vegetable market update from $source.';
    }

    return 'Latest produce news from $source covering $title.';
  }

  DateTime _parseSeenDate(String value) {
    if (value.length >= 14) {
      final normalized =
          '${value.substring(0, 4)}-${value.substring(4, 6)}-'
          '${value.substring(6, 8)}T${value.substring(8, 10)}:'
          '${value.substring(10, 12)}:${value.substring(12, 14)}Z';

      return DateTime.tryParse(normalized)?.toLocal() ?? DateTime.now();
    }

    return DateTime.now();
  }

  String _stringValue(Object? value, {String fallback = ''}) {
    if (value == null) {
      return fallback;
    }

    final text = value.toString().trim();
    return text.isEmpty ? fallback : text;
  }

  String _cleanText(String value) {
    return value.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
