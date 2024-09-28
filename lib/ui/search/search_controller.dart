import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/domain/movie/i_movie_repo.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/domain/movie/movie_results.dart';
import 'package:tmdb_viewer/domain/movie/movie_wrapper.dart';
import 'package:tmdb_viewer/res/values/config.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';

import '../../domain/genre/genre_model.dart';
import '../../res/values/constants.dart';

class SearchController extends BaseController {
  final IMovieRepo _movieRepo;

  SearchController(this._movieRepo);

  late List<Genre> movieGenres;

  final textController = TextEditingController();
  final RxBool showClearIcon = false.obs;
  final RxList<Selectable<Genre>> selectedGenreFilter =
      <Selectable<Genre>>[].obs;
  final RxList<int> currentGenreFilter = <int>[].obs;
  final RxList<MovieWrapper> results = <MovieWrapper>[].obs;

  final _searchQueryStream = rx.BehaviorSubject<String>.seeded("");
  final _genreFilterStream = rx.BehaviorSubject<List<int>>.seeded([]);

  @override
  void onInit() {
    super.onInit();

    movieGenres = Get.arguments[AppConstants.genres];
    selectedGenreFilter.value =
        movieGenres.map((e) => Selectable<Genre>(e)).toList();

    rx.Rx.combineLatest2(
      _searchQueryStream.stream.distinct(),
      _genreFilterStream.stream.distinct(),
      (String query, List<int> genres) => MapEntry(query, genres),
    )
        .debounceTime(const Duration(milliseconds: 500))
        .switchMap((combined) async* {
      final results = await _search(combined.key, combined.value);
      yield results;
    }).listen((r) {
      results.value = r;
    });
  }

  @override
  void onClose() {
    _searchQueryStream.close();
    _genreFilterStream.close();
    super.onClose();
  }

  void onTextChange(String query) {
    showClearIcon.value = query.trim().isNotEmpty;
    _searchQueryStream.add(query);
  }

  void onClear() {
    textController.clear();
    showClearIcon.value = false;
    _searchQueryStream.add("");
  }

  Future<List<MovieWrapper>> _search(String query, List<int> genreIds) async {
    // No query and no filters selected
    if (query.trim().isEmpty && genreIds.isEmpty) {
      return [];
    }

    // Both query and filters selected
    if (query.trim().isNotEmpty && genreIds.isNotEmpty) {
      final res = await _movieRepo.getMoviesByQuery(AppConfig.locale, query);
      if (res is ResultSuccess<PageResults<Movie>>) {
        final filteredMovies = res.value.results
            .where((movie) => currentGenreFilter.value
                .every((genreId) => movie.genreIds.contains(genreId)))
            .toList();
        return filteredMovies
            .map((e) => MovieWrapper(
                genres: movieGenres
                    .where((genre) => e.genreIds.contains(genre.id))
                    .toList(),
                movie: e))
            .toList();
      }
      return [];
    }

    // Only filters selected, no query
    if (query.trim().isEmpty) {
      final res = await _movieRepo.getMoviesByGenre(AppConfig.locale, genreIds);
      if (res is ResultSuccess<PageResults<Movie>>) {
        return res.value.results
            .map((e) => MovieWrapper(
                genres: movieGenres
                    .where((genre) => e.genreIds.contains(genre.id))
                    .toList(),
                movie: e))
            .toList();
      }
      return [];
    }

    // Only query, no filters
    final res = await _movieRepo.getMoviesByQuery(AppConfig.locale, query);
    if (res is ResultSuccess<PageResults<Movie>>) {
      return res.value.results
          .map((e) => MovieWrapper(
              genres: movieGenres
                  .where((genre) => e.genreIds.contains(genre.id))
                  .toList(),
              movie: e))
          .toList();
    }

    return [];
  }

  void onSelectFilter(Genre g) {
    final List<Selectable<Genre>> l = selectedGenreFilter.value;
    final element = l.firstWhere((e) => e.model.id == g.id);
    element.isSelected = !element.isSelected;
    selectedGenreFilter.value = l.obs;
  }

  void onResetFilter() {
    selectedGenreFilter.value =
        movieGenres.map((e) => Selectable<Genre>(e)).toList();
  }

  void applyFilter() {
    currentGenreFilter.value = selectedGenreFilter.value
        .where((e) => e.isSelected)
        .map((e) => e.model.id)
        .toList();
    _searchQueryStream.add(textController.text);
    _genreFilterStream.add(currentGenreFilter.value);
  }
}

class Selectable<T> {
  final T model;
  bool isSelected;

  Selectable(this.model, {this.isSelected = false});
}
