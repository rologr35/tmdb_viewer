

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/domain/actor/actor_model.dart';
import 'package:tmdb_viewer/domain/actor/i_actor_repository.dart';
import 'package:tmdb_viewer/domain/movie/author_details.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/domain/movie/movie_details.dart';
import 'package:tmdb_viewer/domain/movie/movie_reviews.dart';
import 'package:tmdb_viewer/domain/movie/movie_wrapper.dart';
import 'package:tmdb_viewer/enums.dart';
import 'package:tmdb_viewer/res/values/config.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';
import 'package:tmdb_viewer/ui/_base/message_handler.dart';
import 'package:tmdb_viewer/ui/_base/loading_handler.dart';
import '../../domain/movie/movie_results.dart';

class MovieDetailsController extends BaseController with LoadingHandler, MessageHandler {
  final IMovieRepo _movieRepo;
  final IActorRepository _actorRepository;

  MovieDetailsController(this._actorRepository, this._movieRepo);

  final pageController = PageController();
  late Rx<MovieWrapper> movie;
  final Rx<MovieDetailsTabs> tab = Rx(MovieDetailsTabs.details);

  final RxBool isLoadingReviews = false.obs;

  final fakeCast = List.filled(
      10,
      const Actor(
          id: -1,
          name: "",
          castId: -1,
          character: "",
          order: -1,
          originalName: "",
          profilePath: null));

  @override
  void onInit() {
    super.onInit();
    movie = Rx(Get.arguments['details']);
    _loadData();
  }

  @override
  void onClose() {
    disposeLoadingHandler();
    super.onClose();
  }

  void _loadData() async {
    final futures = <Future>[];
    loadReviews(refreshing: false);
    if(movie.value.movieDetails == null) {
      futures.add(_movieRepo.getMovieDetails(AppConfig.locale, movie.value.movie.id));
    }
    if(movie.value.cast == null) {
      futures.add(_actorRepository.getMovieCast(movie.value.movie.id, AppConfig.locale));
    }
    if(futures.isNotEmpty) {
      isLoading = true;
      final results = await Future.wait(futures);
      for(var res in results) {
        if(res is ResultSuccess<List<Actor>>) {
          movie.value.cast = res.value;
          movie.refresh();
        } else if (res is ResultSuccess<MovieDetails>) {
          movie.value.movieDetails = res.value;
          movie.refresh();
        }
      }
      isLoading = false;
    }
  }

  int currentPageReviews = 0;
  int totalPagesReviews = 0;
  final refreshController = RefreshController();
  final RxList<MovieReview> reviews = <MovieReview>[].obs;

  Future<void> loadReviews({bool refreshing = true}) async {
    if(!refreshing) {
      reviews.value = List.filled(20, MovieReview(
        id: "",
        author: BoneMock.words(2),
        content: BoneMock.words(5),
        createdAt: null,
        updatedAt: null,
        url: "",
        authorDetails: AuthorDetails(name: BoneMock.words(2), username: BoneMock.words(1), rating: 0, avatarPath: "")
      ));
      isLoadingReviews.value = true;
    } else {
      totalPagesReviews = 0;
      currentPageReviews = 0;
    }
    final res = await _movieRepo.getReviews(AppConfig.locale, movie.value.movie.id, page: currentPageReviews + 1);
    if(res is ResultSuccess<PageResults<MovieReview>>) {
      currentPageReviews++;
      totalPagesReviews = res.value.totalPages;
      reviews.value = res.value.results;
    } else {
      reviews.value = [];
    }
    if(!refreshing) isLoadingReviews.value = false;
  }

  Future<void> loadMoreReviews() async {
    if(currentPageReviews < totalPagesReviews) {
      final res = await _movieRepo.getReviews(AppConfig.locale, movie.value.movie.id, page: currentPageReviews + 1);
      if(res is ResultSuccess<PageResults<MovieReview>>) {
        currentPageReviews++;
        reviews.addAll(res.value.results);
        reviews.refresh();
      }
    }
  }

}