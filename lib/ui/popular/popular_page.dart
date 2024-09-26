import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_cached_image.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_noappbar_widget.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_standard_appbar.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/ui/popular/popular_controller.dart';
import 'package:tmdb_viewer/utils/extensions.dart';

import '../../data/api/_remote/endpoints.dart';
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
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
      body: Obx(() => SmartRefresher(
          enablePullDown: !controller.isLoading,
          enablePullUp: !controller.isLoading,
          header: const WaterDropHeader(),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: GridView.builder(
              itemCount: controller.popularMovies.length,
              padding: const EdgeInsets.all(15),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (120.0 / 185.0),
                crossAxisCount: 3,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Skeletonizer(
                  enabled: controller.isLoading,
                    child: InkWell(
                      onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: controller.popularMovies[index].posterPath.isNullOrEmpty()
                        ? Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(AppImages.splashLogo)
                            , fit: BoxFit.cover),
                        color: isDarkMode ? AppColors.grayDark : AppColors.grayLight,
                      )
                    )
                        : TXCachedNetworkImage(
                      placeholder: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(AppImages.splashLogo)
                                , fit: BoxFit.cover),
                            color: isDarkMode ? AppColors.grayDark : AppColors.grayLight,
                          )
                      ),
                      imageUrl: "${Endpoint.imageUrl500}${controller.popularMovies[index].posterPath}",
                    ),
                  ),
                ));
              }))),
    );
  }
}
