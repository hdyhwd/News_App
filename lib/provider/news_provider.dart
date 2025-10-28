import 'package:flutter/material.dart';
import '../models/news_model.dart';
import '../services/api_service.dart';

class NewsProvider extends ChangeNotifier {
  final List<NewsArticle> _articles = ApiService.getDummyArticles();
  final List<NewsArticle> _favorites = [];

  List<NewsArticle> get articles => _articles;
  List<NewsArticle> get favorites => _favorites;

  // Ditambahkan: Fungsi untuk memfilter artikel berdasarkan kategori
  List<NewsArticle> getArticlesByCategory(String category) {
    if (category == 'All') {
      return _articles;
    }
    return _articles
        .where((article) =>
            article.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  // Ditambahkan: Hanya untuk 'Trending Now' (kita ambil 2 artikel pertama)
  List<NewsArticle> get trendingArticles => _articles.take(2).toList();

  void toggleFavorite(NewsArticle article) {
    if (_favorites.contains(article)) {
      _favorites.remove(article);
    } else {
      _favorites.add(article);
    }
    notifyListeners();
  }

  bool isFavorite(NewsArticle article) {
    return _favorites.contains(article);
  }
}