
import 'package:flutter/material.dart';
import 'package:project3/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieSearchPage extends StatefulWidget {
  const MovieSearchPage({super.key});

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {

  final String apiKey = 'API KEY';
  final String apiUrl = 'https://www.omdbapi.com/';  // <-------- free

  final TextEditingController _searchController = TextEditingController();
  List<Movie> _movies = [];
  bool _isLoading = false;
  String _errorMessage = '';


  Future<void> _searchMovies(String query) async {    // <----- fetch data from api
    if (query.isEmpty) {
      setState(() {
        _movies = [];
        _errorMessage = '';
      });
      return;
    }

    if (apiKey == 'API KEY') {          // <---- OMDb API key to the code.
      setState(() {
        _errorMessage = 'Please add your Movie';
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final response = await http.get(Uri.parse('$apiUrl?s=$query&apikey=$apiKey'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['Response'] == 'True') {
          final List<dynamic> movieResults = data['Search'];
          setState(() {
            _movies = movieResults.map((json) => Movie.fromJson(json)).toList();
            _errorMessage = '';
          });
        } else {
          setState(() {
            _errorMessage = data['Error'] ?? 'An unknown error occurred.';
            _movies = [];
          });
        }
      } else {
        setState(() {
          _errorMessage = 'Failed to load movies. Please check your connection.';
          _movies = [];
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'An error occurred: ${e.toString()}';
        _movies = [];
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Movie Search',
            style: TextStyle(
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            Expanded(child: _buildResultsDisplay()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search for a movie...',
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            _searchController.clear();
            setState(() {
              _movies = [];
              _errorMessage = '';
            });
          },
        ),
        filled: true,
        fillColor: Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
      onSubmitted: (value) {
        _searchMovies(value);
      },
    );
  }

  Widget _buildResultsDisplay() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return Center(
        child: Text(
          _errorMessage,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.redAccent, fontSize: 16),
        ),
      );
    }

    if (_movies.isEmpty && _searchController.text.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_filter_outlined, size: 80, color: Colors.white38),
            SizedBox(height: 16),
            Text(
              'Find your favorite movies!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
          ],
        ),
      );
    }

    if (_movies.isEmpty) {
      return Center(
        child: Text(
          'No movies found.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      );
    }
    return ListView.builder(
      itemCount: _movies.length,
      itemBuilder: (context, index) {
        final movie = _movies[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    movie.posterUrl,
                    width: 80,
                    height: 120,
                    fit: BoxFit.cover,

                    errorBuilder: (context, error, stackTrace) {   // <----- Error builder for images that fail to load
                      return Container(
                        width: 80,
                        height: 120,
                        color: Colors.grey[800],
                        child: Icon(Icons.movie, color: Colors.white54),
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Year: ${movie.year}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
