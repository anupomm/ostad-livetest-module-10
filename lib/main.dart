import 'package:flutter/material.dart';

void main() {
  runApp(const NewsFeedApp());
}

class NewsFeedApp extends StatelessWidget {
  const NewsFeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed App',
      debugShowCheckedModeBanner: false,
      home: NewsFeedScreen(),
    );
  }
}
class NewsFeedScreen extends StatelessWidget {
  final List<NewsArticle> newsArticles = [
    NewsArticle(imageUrl: 'https://img.freepik.com/free-vector/breaking-news-information-concept_52683-36243.jpg?w=740&t=st=1689613689~exp=1689614289~hmac=0e4d44db741cb048162a01c183380ef6f4313582cc6e95961b65717c30cccd20'),
    NewsArticle(imageUrl: 'https://img.freepik.com/free-vector/breaking-news-streaming_23-2148514239.jpg?w=740&t=st=1689613720~exp=1689614320~hmac=e811647138c51e4d806358910caa4be3d4452cfcfa0dd8a07c384feb921632ad'),
    NewsArticle(imageUrl: 'https://img.freepik.com/free-vector/technology-global-eath-concept-background_1017-33688.jpg?w=826&t=st=1689613768~exp=1689614368~hmac=d72600559046c5b962bb488d57ce9f8e4e379c4d9a37e32ba3afcd43150b0575'),
    NewsArticle(imageUrl: 'https://img.freepik.com/free-vector/non-stop-news-concept-background_1017-14192.jpg?w=740&t=st=1689614628~exp=1689615228~hmac=37b3c7fdc5b09595b11dcdd063b06a81a0dbc2eea9b541f303a14d8b4d48d11e'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView.builder(
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                final article = newsArticles[index];
                return NewsArticleTile(article: article);
              },
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: newsArticles.length,
              itemBuilder: (context, index) {
                final article = newsArticles[index];
                return NewsArticleTile(article: article);
              },
            );
          }
        },
      ),
    );
  }
}

class NewsArticle {
  final String imageUrl;

  NewsArticle({required this.imageUrl});
}

class NewsArticleTile extends StatelessWidget {
  final NewsArticle article;

  const NewsArticleTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.network(
        article.imageUrl,
        fit: BoxFit.contain,
      ),
    );
  }
}
