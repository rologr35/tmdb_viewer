import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/res/values/images.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_icon_button_widget.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_noappbar_widget.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_standard_appbar.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/ui/movies/components/movies_carrousel/movies_carrousel_widget.dart';
import 'package:tmdb_viewer/ui/movies/components/trending_movies/trending_movies_widget.dart';
import 'package:tmdb_viewer/ui/movies/movies_controller.dart';

import '../../res/R.dart';

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
              icon: const Icon(Icons.search, size: 30), onPressed: () {})
        ],
        body: Obx(() => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Skeletonizer(
                  enabled: controller.isLoading,
                  child: Column(children: [
                    TrendingMoviesWidget(
                        movies: controller.trendingMovies.value),
                    const SizedBox(
                      height: 30,
                    ),
                    MoviesCarrouselWidget(
                        movies: controller.nowPlayingMovies,
                        title: R.string.playingNow,
                        icon: Icons.play_circle_outline),
                    const SizedBox(
                      height: 30,
                    ),
                    MoviesCarrouselWidget(
                        movies: controller.upcomingMovies,
                        title: R.string.comingSoon,
                        icon: Icons.calendar_month),
                    const SizedBox(
                      height: 30,
                    ),
                    MoviesCarrouselWidget(
                        movies: controller.topRatedMovies, title: R.string.topRated),
                  ])),
            )));
  }
}
