import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_gridview_movies.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_standard_appbar.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/ui/popular/popular_controller.dart';

import '../../app_config/app_pages/app_pages.dart';
import '../../res/R.dart';
import '../../res/values/constants.dart';
import '../../res/values/images.dart';
import '../_widgets/tx_icon_button_widget.dart';

class PopularPage extends GetResponsiveView<PopularController> {
  PopularPage({super.key});

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await controller.loadPopularMovies();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await controller.loadMore();
    _refreshController.loadComplete();
  }

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
      body: Obx(() => controller.popularMovies.isEmpty ? Center(
        child: TXTextWidget(R.string.nothingToShow, fontSize: 16),
      ) : TXGridViewMovies(
        useRefresher: true,
          enablePullDown: !controller.isLoading,
          enablePullUp: !controller.isLoading,
          header: const WaterDropHeader(),
          refreshController: _refreshController,
          onRefresh: _onRefresh,
          onLoadingMore: _onLoading,
          isLoading: controller.isLoading,
          onTap: (movie) {
            Get.toNamed("${AppPages.instance.movies}/${movie.movie.id}",
                arguments: {"details": movie});
          },
          movies: controller.popularMovies.value)),
    );
  }
}
