
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project2/main.dart';

class Article {
  final String title;
  final String? description;
  final String? urlToImage;
  final String? publishedAt;
  final String? author;
  final String? content;
  final String url;

  Article({
    required this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
    this.author,
    this.content,
    required this.url,
  });



  factory Article.fromJson(Map<String, dynamic> json) {    // <------ // create an Article from a JSON object.
    return Article(
      title: json['title'] ?? 'No Title',
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      author: json['author'],
      content: json['content'],
      url: json['url'] ?? '',
    );
  }
}



class NewsApiService {     //   <----- Handles fetching and parsing news articles from the NewsAPI.
  Future<List<Article>> fetchArticles() async {
    if (API_KEY == 'API KEY') {
      throw Exception(    // <------// Throw an exception for app from crashing.
          "YOUR_API KEY");
    }

    try {
      final response = await http.get(Uri.parse(API_URL));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> articlesJson = json['articles'] ?? [];
        return articlesJson
            .map((json) => Article.fromJson(json))
            .where((article) => article.url.isNotEmpty)
            .toList();
      } else {      // <----- for Handle non-200 responses (API errors)
        final Map<String, dynamic> json = jsonDecode(response.body);
        throw Exception('Failed to load news: ${json['message']}');
      }
    } catch (e) {
      throw Exception('Failed to load news. Check your connection or API Key. Error: $e');
    }
  }
}
