import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/news_provider.dart';
import '../utils/app_colors.dart';
import '../widgets/article_list_tile.dart';
import 'detail_page.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    const categories = ['All', 'Politics', 'Technology', 'Business', 'Education'];

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0, // Sembunyikan AppBar utama
          bottom: TabBar(
            isScrollable: true,
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.gray,
            indicatorColor: AppColors.primaryColor,
            indicatorWeight: 3.0,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            tabs: categories.map((c) => Tab(text: c)).toList(),
          ),
        ),
        body: TabBarView(
          children: categories
              .map((category) =>
                  _ArticleCategoryList(category: category))
              .toList(),
        ),
      ),
    );
  }
}

class _ArticleCategoryList extends StatelessWidget {
  final String category;
  const _ArticleCategoryList({required this.category});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final articles = newsProvider.getArticlesByCategory(category);

    if (articles.isEmpty) {
      return Center(
        child: Text('No articles found in $category.'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ArticleListTile(
          article: article,
          isFavorite: newsProvider.isFavorite(article),
          onFavoriteToggle: () => newsProvider.toggleFavorite(article),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(article: article),
              ),
            );
          },
        );
      },
    );
  }
}