
import 'package:flutter/material.dart';
import 'package:project2/models/article.dart';
import 'package:intl/intl.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({super.key, required this.article});


  String _formatDate(String? dateStr) {        // <------- for date formating
    if (dateStr == null) return "Date not available";
    try {
      final dateTime = DateTime.parse(dateStr);
      return DateFormat.yMMMMd('en_US').add_jm().format(dateTime);
    } catch (e) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16213E),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            pinned: true,
            backgroundColor: Color(0xFF1A1A2E),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                article.author ?? 'Author name not found',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              centerTitle: true,
              background: article.urlToImage != null
                  ? Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 60,
                        color: Colors.white54,),
                  );
                },
              )
                  : Container(color: Color(0xFF0F3460),
                  child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 60,
                        color: Colors.white54,),
                  ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 10),
                    Text(
                      _formatDate(article.publishedAt),
                      style: TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),
                    ),

                    SizedBox(height: 20),
                    Text(
                      article.content ?? article.description ?? 'No content available.',
                      style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.87), height: 1.5),
                    ),

                    SizedBox(height: 20),
                    Text(
                      'For the full story, visit the original article.', // <----  for more details with open url -----> package for `url_launcher` to open the URL.
                      style: TextStyle(color: Colors.blue[300]),
                    ),

                    SizedBox(height: 5),
                    Text(
                      article.url,
                      style: TextStyle(color: Colors.blue[300], decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
