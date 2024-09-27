

import 'package:tmdb_viewer/domain/movie/movie_model.dart';

class MovieResults {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<Movie> results;

  MovieResults({required this.page, required this.totalPages, required this.results, required this.totalResults});

  factory MovieResults.fromJson(Map<String, dynamic> json) => MovieResults(
    page: json['page'],
    results: (json['results'] as List<dynamic>).map((e) => Movie.fromJson(e)).toList(),
    totalPages: json['total_pages'],
    totalResults: json['total_results']
  );
}