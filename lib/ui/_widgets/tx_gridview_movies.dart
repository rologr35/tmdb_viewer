
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:tmdb_viewer/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/domain/movie/movie_wrapper.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_cached_image.dart';

import '../../data/api/_remote/endpoints.dart';
import '../../res/values/colors.dart';
import '../../res/values/images.dart';

class TXGridViewMovies extends StatelessWidget {
  final List<MovieWrapper> movies;
  final bool isLoading;
  final ValueChanged<MovieWrapper> onTap;
  final bool useRefresher;
  final bool enablePullDown;
  final bool enablePullUp;
  final Widget? header;
  final RefreshController? refreshController;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadingMore;

  const TXGridViewMovies({super.key,
    this.useRefresher = false,
    required this.isLoading,
    required this.onTap,
    required this.movies,
    this.enablePullDown = false,
    this.enablePullUp = false,
    this.refreshController,
    this.header,
    this.onLoadingMore,
    this.onRefresh
  });

  @override
  Widget build(BuildContext context) => useRefresher ? SmartRefresher(
    enablePullDown: enablePullDown,
    enablePullUp: enablePullUp,
    header: header,
    controller: refreshController ?? RefreshController(),
    onRefresh: onRefresh,
    onLoading: onLoadingMore,
    child: _getView(context),
  ) : _getView(context);

  Widget _getView(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GridView.builder(
        itemCount: movies.length,
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (120.0 / 185.0),
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Skeletonizer(
              enabled: isLoading,
              child: InkWell(
                onTap: movies[index].movie.id == -1
                    ? null
                    : () {
                  onTap(movies[index]);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: movies[index].movie.posterPath
                      .isNullOrEmpty()
                      ? Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(AppImages.splashLogo),
                            fit: BoxFit.cover),
                        color: isDarkMode
                            ? AppColors.grayDark
                            : AppColors.grayLight,
                      ))
                      : TXCachedNetworkImage(
                    placeholder: Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(AppImages.splashLogo),
                              fit: BoxFit.cover),
                          color: isDarkMode
                              ? AppColors.grayDark
                              : AppColors.grayLight,
                        )),
                    imageUrl:
                    "${Endpoint.imageUrl500}${movies[index].movie.posterPath}",
                  ),
                ),
              ));
        });
  }
}