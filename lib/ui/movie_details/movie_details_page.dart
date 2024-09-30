import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tmdb_viewer/enums.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_standard_appbar.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/ui/movie_details/about/movie_about_view.dart';
import 'package:tmdb_viewer/ui/movie_details/movie_details_controller.dart';
import 'package:tmdb_viewer/ui/movie_details/reviews/movie_reviews_view.dart';

import '../../res/R.dart';
import '../_widgets/tx_segmented_widget.dart';

class MovieDetailsPage extends GetResponsiveView<MovieDetailsController> {
  MovieDetailsPage({super.key});

  void _onRefreshReviews() async {
    await controller.loadReviews(refreshing: true);
    controller.refreshController.refreshCompleted();
  }

  void _onLoadingReviews() async {
    await controller.loadMoreReviews();
    controller.refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Obx(() => TXStandardAppbarWidget(
            safeArea: false,
            title: controller.movie.value.movie.title,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TXSegmentedWidget(
                      list: [
                        SelectionModel(
                            name: R.string.about,
                            key: MovieDetailsTabs.details.name,
                            isSelected: MovieDetailsTabs.details ==
                                controller.tab.value),
                        SelectionModel(
                            name: R.string.reviews,
                            key: MovieDetailsTabs.reviews.name,
                            isSelected: MovieDetailsTabs.reviews ==
                                controller.tab.value),
                      ],
                      onTap: (value) {
                        final selected = MovieDetailsTabs.values
                            .firstWhere((element) => element.name == value.key);
                        controller.tab.value = selected;
                        controller.pageController.animateToPage(selected.index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease);
                      }),
                ),
                Expanded(
                    child: PageView.builder(
                        itemCount: 2,
                        controller: controller.pageController,
                        onPageChanged: (i) {
                          controller.tab.value = MovieDetailsTabs.values[i];
                        },
                        itemBuilder: (context, index) {
                          return Obx(() => index == 0 ? MovieAboutView(
                            fakeCast: controller.fakeCast,
                            movie: controller.movie.value,
                            isLoading: controller.isLoading,
                          ) : MovieReviewsView(
                              onRefresh: _onRefreshReviews,
                              onLoadingMore: _onLoadingReviews,
                              isLoading: controller.isLoadingReviews.value,
                              reviews: controller.reviews.value,
                              enablePullUp: !controller.isLoadingReviews.value,
                              enablePullDown: !controller.isLoadingReviews.value && controller.reviews.isNotEmpty,
                              header: const WaterDropHeader(),
                              refreshController: controller.refreshController));
                        }))
              ],
            ))));
  }
}
