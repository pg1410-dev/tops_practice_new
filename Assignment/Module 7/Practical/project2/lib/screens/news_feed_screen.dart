
import 'package:flutter/material.dart';
import 'package:project2/widgets/article_card.dart';
import 'package:project2/models/article.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {


  final NewsApiService _newsApiService = NewsApiService();
  late Future<List<Article>> _articlesFuture;

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  void _fetchArticles() {
    setState(() {
      _articlesFuture = _newsApiService.fetchArticles();
    });
  }

  Future<void> _refreshArticles() async {
    _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16213E),
      appBar: AppBar(
        title: Text('Top Headlines'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshArticles,
        color: Colors.indigoAccent,
        backgroundColor: Color(0xFF1A1A2E),
        child: FutureBuilder<List<Article>>(
          future: _articlesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return _buildErrorWidget(snapshot.error.toString());
            } else if (snapshot.hasData) {
              final articles = snapshot.data!;
              return ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ArticleCard(article: articles[index]);
                },
              );
            } else {
              return Center(child: Text('No news available.'));
            }
          },
        ),
      ),
    );
  }


  Widget _buildErrorWidget(String error) {   // <----- error message display
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 60),
            SizedBox(height: 20),
            Text(
              'Oops! Something went wrong.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),

            SizedBox(height: 10),
            Text(
              error.replaceFirst('Exception: ', ''),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[400]),
            ),

            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _refreshArticles,
              icon: Icon(Icons.refresh),
              label: Text('Try Again'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.indigoAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}