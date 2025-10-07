
class Movie {
  final String title;
  final String year;
  final String imdbID;
  final String posterUrl;

  Movie({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.posterUrl,
  });


  factory Movie.fromJson(Map<String, dynamic> json) {  // <------ create a Movie from JSON
    return Movie(
      title: json['Title'] ?? 'N/A',
      year: json['Year'] ?? 'N/A',
      imdbID: json['imdbID'] ?? '',

      posterUrl: (json['Poster'] == 'N/A' || json['Poster'] == null)
          ? 'https://placehold.co/300x450/000000/FFFFFF?text=No+Image'
          : json['Poster'],
    );
  }
}