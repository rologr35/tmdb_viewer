

import 'package:get/get.dart';
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/config.dart';
import 'package:tmdb_viewer/res/values/constants.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';
import 'package:tmdb_viewer/ui/_base/loading_handler.dart';

import '../../domain/genre/genre_model.dart';
import '../../utils/logger.dart';

class MoviesController extends BaseController  with LoadingHandler{
  final IMovieRepo _movieRepo;

  MoviesController(this._movieRepo);

  final RxList<Movie> trendingMovies = <Movie>[].obs;
  final RxList<Movie> upcomingMovies = <Movie>[].obs;
  final RxList<Movie> nowPlayingMovies =<Movie>[].obs;
  final RxList<Movie> topRatedMovies = <Movie>[].obs;

  late List<Genre> movieGenres;

  @override
  void onInit() {
    super.onInit();
    _loadMovies();
    movieGenres = Get.arguments[AppConstants.genres];
  }

  void _loadMovies() async {
    isLoading = true;
    Future.wait([
      _loadTrendingMovies(),
      _loadNowPlayingMovies(),
      _loadTopRatedMovies(),
      _loadUpcomingMovies()
    ]).then((r) {
      isLoading = false;
    });
  }

  Future<void> _loadTrendingMovies() async {
    final res = await _movieRepo.getTrendingMovies(AppConfig.locale);
    if(res is ResultSuccess<List<Movie>>) {
      trendingMovies.value = res.value;
    }
  }

  Future<void> _loadUpcomingMovies() async {
    final res = await _movieRepo.getComingSoon(AppConfig.locale);
    if(res is ResultSuccess<List<Movie>>) {
      upcomingMovies.value = res.value;
    }
  }

  Future<void> _loadNowPlayingMovies() async {
    final res = await _movieRepo.getNowPlaying(AppConfig.locale);
    if(res is ResultSuccess<List<Movie>>) {
      nowPlayingMovies.value = res.value;
    }
  }

  Future<void> _loadTopRatedMovies() async {
    final res = await _movieRepo.getTopRated(AppConfig.locale);
    if(res is ResultSuccess<List<Movie>>) {
      topRatedMovies.value = res.value;
    }
  }

}