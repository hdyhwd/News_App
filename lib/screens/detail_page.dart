import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/news_model.dart';
import '../provider/news_provider.dart';


class DetailPage extends StatelessWidget {
  final NewsArticle article;
  const DetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // AppBar diatur agar transparan dan ikon di atas gambar
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundColor: Colors.black54,
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.black54,
              child: Icon(Icons.share, color: Colors.white),
            ),
            onPressed: () {
              // Logika share
            },
          ),
          // Menggunakan Consumer agar ikon bookmark tetap update
          Consumer<NewsProvider>(
            builder: (context, provider, child) {
              final isFavorite = provider.isFavorite(article);
              return IconButton(
                icon: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: Icon(
                    isFavorite ? Icons.bookmark : Icons.bookmark_border,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  provider.toggleFavorite(article);
                },
              );
            },
          ),
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.black54,
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar di paling atas, tanpa padding
            Image.network(
              article.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  // Judul
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Author dan Tanggal
                  Text(
                    '${article.author} • ${article.date}',
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 24),

                  // Key Points (Data dummy)
                  const Text(
                    'Key Points',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const _KeyPoint(
                    text:
                        'Travelers have shown airlines that they\'re willing to pay more.',
                  ),
                  const _KeyPoint(
                    text:
                        'Meanwhile, frequent-flyer members\' ranks are swelling.',
                  ),
                  const SizedBox(height: 24),

                  // Konten Artikel
                  Text(
                    article.content,
                    style: const TextStyle(fontSize: 16, height: 1.6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget helper untuk 'Key Points'
class _KeyPoint extends StatelessWidget {
  final String text;
  const _KeyPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, right: 8.0),
            child: CircleAvatar(
              radius: 3,
              backgroundColor: Colors.black54,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}