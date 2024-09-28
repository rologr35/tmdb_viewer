
import 'package:get/get.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/domain/movie/movie_wrapper.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';
import 'package:tmdb_viewer/ui/_base/loading_handler.dart';
import '../../data/repository/_base/result.dart';
import '../../domain/genre/genre_model.dart';
import '../../domain/movie/movie_model.dart';
import '../../domain/movie/movie_results.dart';
import '../../res/values/config.dart';
import '../../res/values/constants.dart';

class PopularController extends BaseController with LoadingHandler {
  final IMovieRepo _movieRepo;

  PopularController(this._movieRepo);

  final RxList<MovieWrapper> popularMovies = <MovieWrapper>[].obs;

  late List<Genre> movieGenres;

  int currentPage = 0;
  int totalPages = 0;

  @override
  void onInit() {
    super.onInit();
    loadPopularMovies(refreshing: false);
    movieGenres = Get.arguments[AppConstants.genres];
  }

  @override
  void onClose() {
    disposeLoadingHandler();
    super.onClose();
  }

  Future<void> loadPopularMovies({bool refreshing = true}) async {
    if(!refreshing) {
      popularMovies.value = List.filled(20, MovieWrapper(
          genres: [],
          cast: null,
          movieDetails: null,
          movie: Movie(
              id: -1,
              backdropPath: '',
              genreIds: [],
              originalTitle: '',
              overview: '',
              popularity: 0.0,
              posterPath: '',
              releaseDate: DateTime.now(),
              title: '',
              voteAverage: 0.0,
              voteCount: 0,
              video: false
          )
      ));
      isLoading = true;
    } else {
      totalPages = 0;
      currentPage = 0;
    }
    final res = await _movieRepo.getPopular(AppConfig.locale, page: currentPage + 1);
    if(res is ResultSuccess<PageResults<Movie>>) {
      currentPage++;
      totalPages = res.value.totalPages;
      popularMovies.value = res.value.results.map((e) => MovieWrapper(
          genres: movieGenres
              .where((genre) => e.genreIds.contains(genre.id))
              .toList(),
          movie: e))
          .toList();
    } else {
      popularMovies.value.clear();
    }
    if(!refreshing) isLoading = false;
  }

  Future<void> loadMore() async {
    if(currentPage < totalPages) {
      final res = await _movieRepo.getPopular(AppConfig.locale, page: currentPage + 1);
      if(res is ResultSuccess<PageResults<Movie>>) {
        currentPage++;
        popularMovies.addAll(res.value.results.map((e) => MovieWrapper(
            genres: movieGenres
                .where((genre) => e.genreIds.contains(genre.id))
                .toList(),
            movie: e))
            .toList());
        popularMovies.refresh();
      }
    }
  }
}