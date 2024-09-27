
import 'package:get/get.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';
import 'package:tmdb_viewer/ui/_base/error_handler.dart';
import 'package:tmdb_viewer/ui/_base/loading_handler.dart';
import '../../data/repository/_base/result.dart';
import '../../domain/genre/genre_model.dart';
import '../../domain/movie/movie_model.dart';
import '../../domain/movie/movie_results.dart';
import '../../res/values/config.dart';
import '../../res/values/constants.dart';

class PopularController extends BaseController with LoadingHandler, ErrorHandler {
  final IMovieRepo _movieRepo;

  PopularController(this._movieRepo);

  final RxList<Movie> popularMovies = <Movie>[].obs;

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
    loadingController.close();
    super.onClose();
  }

  Future<void> loadPopularMovies({bool refreshing = true}) async {
    if(!refreshing) {
      popularMovies.value = List.filled(20, Movie(
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
      ));
      isLoading = true;
    } else {
      totalPages = 0;
      currentPage = 0;
    }
    final res = await _movieRepo.getPopular(AppConfig.locale, page: currentPage + 1);
    if(res is ResultSuccess<MovieResults>) {
      currentPage++;
      totalPages = res.value.totalPages;
      popularMovies.value = res.value.results;
    }
    if(!refreshing) isLoading = false;
  }

  Future<void> loadMore() async {
    if(currentPage < totalPages) {
      final res = await _movieRepo.getPopular(AppConfig.locale, page: currentPage + 1);
      if(res is ResultSuccess<MovieResults>) {
        currentPage++;
        popularMovies.addAll(res.value.results);
        popularMovies.refresh();
      }
    }
  }
}