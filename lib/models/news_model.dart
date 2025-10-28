class NewsArticle {
  final String title;
  final String description;
  final String imageUrl;
  final String date;
  final String source;
  final String content;
  final String author; // Ditambahkan
  final String category; // Ditambahkan

  NewsArticle({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.source,
    required this.content,
    required this.author,
    required this.category,
  });
}