import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/news_provider.dart';
import '../widgets/article_list_tile.dart'; // Diubah dari news_card
import 'detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    final favorites = provider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Articles'),
        centerTitle: false, // Sesuai referensi
      ),
      body: favorites.isEmpty
          ? const Center(
              child: Text('No saved articles yet.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final article = favorites[index];
                return ArticleListTile(
                  article: article,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(article: article),
                      ),
                    );
                  },
                  isFavorite: provider.isFavorite(article),
                  onFavoriteToggle: () {
                    provider.toggleFavorite(article);
                  },
                );
              },
            ),
    );
  }
}