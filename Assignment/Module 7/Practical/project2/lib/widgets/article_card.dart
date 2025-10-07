
import 'package:flutter/material.dart';
import 'package:project2/models/article.dart';
import 'package:project2/screens/article_detail_screen.dart';

class ArticleCard extends StatelessWidget {
  final Article article;

  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(article: article),
          ),
        );
      },
      child: Card(
        color: Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildArticleImage(),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  if (article.description != null)
                    Text(
                      article.description!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleImage() {   // <------ for article image with placeholder and error handling.
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      child: article.urlToImage != null
          ? Image.network(
        article.urlToImage!,
        height: 200,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: 200,
            color: Colors.grey[800],
            child: Center(child: CircularProgressIndicator()),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderImage();
        },
      )
          : _buildPlaceholderImage(),
    );
  }


  Widget _buildPlaceholderImage() {   // <------ // Placeholder widget for when an image is missing or fails to load.
    return Container(
      height: 200,
      color: Color(0xFF0F3460),
      child: Center(
        child: Icon(
          Icons.image_not_supported,
          color: Colors.white54,
          size: 50,
        ),
      ),
    );
  }
}
