import '../models/news_model.dart';

class ApiService {
  static List<NewsArticle> getDummyArticles() {
    return [
      NewsArticle(
        title: 'Meta donates \$1 million to Trump\'s inaugural fund: Reuters',
        description:
            'Meta Platforms will donate \$1 million to support Donald Trump\'s presidential inauguration.',
        imageUrl:
            'https://media.istockphoto.com/id/1401522397/id/vektor/penyiar-berita-pria-duduk-di-studio-reporter-melaporkan-di-lokasi-bencana.jpg?s=1024x1024&w=is&k=20&c=AHFgmISOV7uEylui_3hRYQ1p4kSFbPcg9tfEviPeFCY=',
        date: 'Dec 12, 2024',
        source: 'Reuters',
        content:
            'Meta Platforms (META.O), opens new tab will donate \$1 million to support Donald Trump\'s presidential inauguration, the company said on Thursday, returning to a tradition it suspended after the Jan. 6, 2021, attack on the U.S. Capitol.',
        author: 'Aisha Grant',
        category: 'Politics',
      ),
      NewsArticle(
        title: 'Former OpenAI researcher and whistleblower found dead',
        description:
            'The body of the researcher was found in his apartment following his recent public statements.',
        imageUrl:
            'https://media.istockphoto.com/id/1401522397/id/vektor/penyiar-berita-pria-duduk-di-studio-reporter-melaporkan-di-lokasi-bencana.jpg?s=1024x1024&w=is&k=20&c=AHFgmISOV7uEylui_3hRYQ1p4kSFbPcg9tfEviPeFCY=',
        date: 'Dec 12, 2024',
        source: 'Tech Crunch',
        content:
            'Details are still emerging, but police have confirmed the death of the former OpenAI researcher known for his critical whistleblowing reports on AI safety protocols.',
        author: 'Brandon Sphiron',
        category: 'Technology',
      ),
      NewsArticle(
        title: 'Why it\'s gotten more difficult to get a free first-class upgrade',
        description:
            'Passengers deplore the business class seating area on an American Airlines flight.',
        imageUrl:
            'https://media.istockphoto.com/id/1401522397/id/vektor/penyiar-berita-pria-duduk-di-studio-reporter-melaporkan-di-lokasi-bencana.jpg?s=1024x1024&w=is&k=20&c=AHFgmISOV7uEylui_3hRYQ1p4kSFbPcg9tfEviPeFCY=',
        date: 'Dec 11, 2024',
        source: 'Getty Images',
        content:
            'Travelers have shown airlines that they\'re willing to pay more to get more room at the front of the cabin. Meanwhile, frequent-flyer members\' ranks are swelling, meaning there\'s more competition for upgrades when seats are available.',
        author: 'Antonio Botosh',
        category: 'Business',
      ),
      NewsArticle(
        title: 'Apple and Google instructed by House committee to prepare',
        description: 'New regulations are being drafted for big tech.',
        imageUrl:
            'https://media.istockphoto.com/id/1401522397/id/vektor/penyiar-berita-pria-duduk-di-studio-reporter-melaporkan-di-lokasi-bencana.jpg?s=1024x1024&w=is&k=20&c=AHFgmISOV7uEylui_3hRYQ1p4kSFbPcg9tfEviPeFCY=',
        date: 'Dec 14, 2024',
        source: 'The Verge',
        content:
            'The House committee has put Apple and Google on notice, instructing them to prepare for new regulatory testimony regarding app store policies and data privacy.',
        author: 'Jonathan Vanian',
        category: 'Technology',
      ),
    ];
  }
}