import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/news_provider.dart';
import '../utils/app_colors.dart';
import '../widgets/trending_card.dart';
import '../widgets/article_list_tile.dart';
import 'detail_page.dart';

class HomePageTab extends StatelessWidget {
  // 1. Tambahkan variabel untuk menampung fungsi
  final VoidCallback onSeeAllPressed;

  // 2. Tambahkan di constructor
  const HomePageTab({super.key, required this.onSeeAllPressed});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    final trending = newsProvider.trendingArticles;
    final latest = newsProvider.articles;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Read News'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // ... (Search Bar tidak berubah)
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: AppColors.lightGray,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Trending Now Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trending Now',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              // 3. Bungkus Row "See All" dengan GestureDetector
              GestureDetector(
                onTap: onSeeAllPressed, // <-- Panggil fungsinya di sini
                child: Row(
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                    const Icon(Icons.arrow_forward,
                        color: AppColors.primaryColor, size: 16),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          
          // ... (Sisa kodenya sama)
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: trending.length,
              itemBuilder: (context, index) {
                final article = trending[index];
                return TrendingCard(
                  article: article,
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
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Latest News',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            itemCount: latest.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final article = latest[index];
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
                onFavoriteToggle: () {
                  newsProvider.toggleFavorite(article);
                },
                isFavorite: newsProvider.isFavorite(article),
              );
            },
          ),
        ],
      ),
    );
  }
}