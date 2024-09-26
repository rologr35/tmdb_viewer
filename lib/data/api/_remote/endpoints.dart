
class Endpoint {
  static const String baseUrl = "https://api.themoviedb.org/3";

  ///movies
  static const trendingMoviesDay = "/trending/movie/day";
  static const nowPlaying = "/movie/now_playing";
  static const comingSoon = "/movie/upcoming";
  static const topRated = "/movie/top_rated";
  static const popular = "/movie/popular";

  ///genres
  static const genres = "/genre/movie/list";

  ///People
  static cast(int movieId, String language) => "/movie/$movieId/credits?language=$language";

  static const imageUrl250 = "https://image.tmdb.org/t/p/w200";
  static const imageUrl500 = "https://image.tmdb.org/t/p/w500";
  static const imageUrl780 = "https://image.tmdb.org/t/p/w780";
  static const imageUrl = "https://image.tmdb.org/t/p/original";
}
