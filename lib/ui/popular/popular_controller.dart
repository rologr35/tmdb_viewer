

import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';
import 'package:tmdb_viewer/ui/_base/loading_handler.dart';
import 'dart:math' as math;
import '../../data/repository/_base/result.dart';
import '../../domain/genre/genre_model.dart';
import '../../domain/movie/movie_model.dart';
import '../../res/values/config.dart';
import '../../res/values/constants.dart';

class PopularController extends BaseController with LoadingHandler {
  final IMovieRepo _movieRepo;

  PopularController(this._movieRepo);

  final RxList<Movie> popularMovies = <Movie>[].obs;

  late List<Genre> movieGenres;

  @override
  void onInit() {
    super.onInit();
    _loadPopularMovies();
    movieGenres = Get.arguments[AppConstants.genres];
  }

  void _loadPopularMovies() async {
    popularMovies.value = List.filled(20, Movie(
        id: math.Random().nextInt(7),
        backdropPath: '',
        genreIds: [],
        originalTitle: '',
        overview: BoneMock.subtitle,
        popularity: 0.0,
        posterPath: '',
        releaseDate: DateTime.now(),
        title: BoneMock.title,
        voteAverage: 0.0,
        voteCount: 0
    ));
    isLoading = true;
    final res = await _movieRepo.getTrendingMovies(AppConfig.locale);
    if(res is ResultSuccess<List<Movie>>) {
      popularMovies.value = res.value;
    }
    isLoading = false;
  }
}