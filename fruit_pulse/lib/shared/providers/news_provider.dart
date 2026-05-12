import 'package:flutter/material.dart';
import '../../core/utils/news_service.dart';
import '../../shared/models/news_article.dart';

class NewsProvider with ChangeNotifier {
  final NewsService _newsService = NewsService();

  List<NewsArticle> _articles = [];
  final Map<String, NewsArticle> _articleCache = {};
  bool _isLoading = false;
  String? _errorMessage;
  String _selectedCategory = 'All';
  List<String> _categories = [];

  List<NewsArticle> get articles => _articles;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get selectedCategory => _selectedCategory;
  List<String> get categories => _categories;

  NewsProvider() {
    _initializeCategories();
    loadNews();
  }

  void _initializeCategories() {
    _categories = _newsService.getCategories();
  }

  Future<void> loadNews({String? category}) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final fetchedArticles = await _newsService.fetchNews(category: category);
      _articles = fetchedArticles;
      for (final article in fetchedArticles) {
        _articleCache[article.id] = article;
      }
      if (category != null) {
        _selectedCategory = category;
      }
    } catch (e) {
      debugPrint('Error loading news: $e');
      _errorMessage = 'Unable to load live news right now. Pull to refresh.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<NewsArticle?> getNewsDetail(String articleId) async {
    return _articleCache[articleId];
  }

  void selectCategory(String category) {
    if (_selectedCategory != category) {
      _selectedCategory = category;
      loadNews(category: category);
    }
  }
}
