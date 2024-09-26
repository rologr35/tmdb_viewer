class AppConstants {

  static const String authToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiMWZjMjZhZDEzYjM0N2NhZjhlYmY4NzcxMWQ1M2QzMiIsIm5iZiI6MTcyNzI0NTU4MC4xODA2MjksInN1YiI6IjY2ZjM0YTU4NDMyOWVjYTAyYzIxNjYxNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PEumTLKnXko1Q9rc_BqfDXyAbfqxydh-L2rt8lVHwYQ";

  static const int codeSuccess = 200;
  static const int codeSuccessCreated = 201;
  static const int codeSuccessAccepted = 202;
  static const int codeSuccessNoContent = 204;
  static const int codeSuccessImUsed = 226;

  static const int codeBadRequest = 400;
  static const int codeUnAuthorized = 401;
  static const int codeForbidden = 403;
  static const int codeNotFound = 404;
  static const int codeNotAccepted = 406;
  static const int codeConflict = 409;
  static const int codePreconditionsFailed = 412;
  static const int codeUnprocessableEntity = 422;
  static const int codeUnavailableLegalReason = 451;

  static const int codeHostUnable = 500;
  static const int codeServiceUnavailable = 503;

  static const String unableHostMessage =  "Failed host lookup: ";
  static const String result =  "result ";

  static const String font =  "Nunito";

  static const genres = "genres";

  ///Movie
  static const backdropPath = "backdrop_path";
  static const originalTitle = "original_title";
  static const posterPath = "poster_path";
  static const genreIds = "genre_ids";
  static const releaseDate = "release_date";
  static const voteAverage = "vote_average";
  static const voteCount = "vote_count";

  ///Actor
  static const castId = "cast_id";
  static const originalName = "original_name";
  static const profilePath = "profile_path";

}