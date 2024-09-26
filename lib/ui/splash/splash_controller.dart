

import 'package:get/get.dart';
import 'package:tmdb_viewer/app_config/app_pages/app_pages.dart';
import 'package:tmdb_viewer/data/repository/_base/result.dart';
import 'package:tmdb_viewer/domain/genre/genre_model.dart';
import 'package:tmdb_viewer/domain/genre/i_genre_repo.dart';
import 'package:tmdb_viewer/res/values/config.dart';
import 'package:tmdb_viewer/ui/_base/_base_controller.dart';

import '../../res/values/constants.dart';

class SplashController extends BaseController {
  final IGenreRepo _genreRepo;

  SplashController(this._genreRepo);

  @override
  void onInit() {
    super.onInit();
    loadGenres();
  }

  Future<void> loadGenres() async {
    final localGenres = await _genreRepo.getMovieGenres(local: true, AppConfig.locale);
    if(localGenres is ResultSuccess<List<Genre>>) {
      if(localGenres.value.isEmpty) {
        final apiGenres = await _genreRepo.getMovieGenres(AppConfig.locale);
        if(apiGenres is ResultSuccess<List<Genre>>) {
          await _genreRepo.addMovieGenres(apiGenres.value, AppConfig.locale);
          Get.offNamed(AppPages.instance.movies, arguments: {
            AppConstants.genres: apiGenres.value
          });
        }
      } else {
        _genreRepo.getMovieGenres(AppConfig.locale).then((apiGenres) {
          if(apiGenres is ResultSuccess<List<Genre>>) {
            _genreRepo.addMovieGenres(apiGenres.value, AppConfig.locale);
          }
        });
        /// Optional
        await Future.delayed(const Duration(seconds: 2));
        Get.offNamed(AppPages.instance.movies, arguments: {
          AppConstants.genres: localGenres.value
        });
      }
    }
  }
}