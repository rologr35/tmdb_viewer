import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/app_config/app_pages/app_pages.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/images.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_standard_appbar.dart';
import 'package:tmdb_viewer/ui/movies/components/movies_carrousel/movies_carrousel_widget.dart';
import 'package:tmdb_viewer/ui/movies/components/trending_movies/trending_movies_widget.dart';
import 'package:tmdb_viewer/ui/movies/movies_controller.dart';

import '../../domain/movie/movie_wrapper.dart';
import '../../res/R.dart';
import '../../res/values/constants.dart';
import '../_widgets/tx_icon_button_widget.dart';

class MoviesPage extends GetResponsiveView<MoviesController> {
  MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TXStandardAppbarWidget(
        leadingWidth: 70,
        leadingWidget: Container(
          margin: const EdgeInsets.only(left: 15),
          child: Image.asset(AppImages.splashLogo),
        ),
        actions: [
          TXIconButtonWidget(
              icon: const Icon(Icons.search, size: 30, color: AppColors.gray),
              onPressed: () {
                if (Bind.isRegistered<SearchController>()) {
                  Bind.delete<SearchController>(force: true);
                }
                Get.toNamed(AppPages.instance.search,
                    arguments: {AppConstants.genres: controller.movieGenres});
              })
        ],
        body: Obx(() => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Skeletonizer(
                  enabled: controller.isLoading,
                  child: Column(children: [
                    TrendingMoviesWidget(
                      movies: controller.trendingMovies.value,
                      onTap: (m) {
                        Get.toNamed("${AppPages.instance.movies}/${m.id}",
                            arguments: {
                              "details": MovieWrapper(
                                  movie: m,
                                  genres: controller.movieGenres.where((genre) => m.genreIds.contains(genre.id)).toList()
                              )
                            });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MoviesCarrouselWidget(
                      movies: controller.nowPlayingMovies,
                      title: R.string.playingNow,
                      icon: Icons.play_circle_outline,
                      onTap: (m) {
                        Get.toNamed("${AppPages.instance.movies}/${m.id}",
                            arguments: {
                              "details": MovieWrapper(
                                  movie: m, genres: controller.movieGenres.where((genre) => m.genreIds.contains(genre.id)).toList())
                            });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MoviesCarrouselWidget(
                      movies: controller.upcomingMovies,
                      title: R.string.comingSoon,
                      icon: Icons.calendar_month,
                      onTap: (m) {
                        Get.toNamed("${AppPages.instance.movies}/${m.id}",
                            arguments: {
                              "details": MovieWrapper(
                                  movie: m, genres: controller.movieGenres.where((genre) => m.genreIds.contains(genre.id)).toList())
                            });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MoviesCarrouselWidget(
                      movies: controller.topRatedMovies,
                      title: R.string.topRated,
                      icon: Icons.star,
                      onTap: (m) {
                        Get.toNamed("${AppPages.instance.movies}/${m.id}",
                            arguments: {
                              "details": MovieWrapper(
                                  movie: m, genres: controller.movieGenres.where((genre) => m.genreIds.contains(genre.id)).toList())
                            });
                      },
                    ),
                  ])),
            )));
  }
}
