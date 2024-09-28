import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:readmore/readmore.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/domain/movie/movie_reviews.dart';
import 'package:tmdb_viewer/res/values/images.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/utils/extensions.dart';

import '../../../data/api/_remote/endpoints.dart';
import '../../../res/R.dart';
import '../../../res/values/colors.dart';
import '../../_widgets/tx_cached_image.dart';

class MovieReviewsView extends StatelessWidget {
  final List<MovieReview> reviews;
  final ValueChanged<MovieReview>? onTap;
  final bool enablePullDown;
  final bool enablePullUp;
  final Widget header;
  final RefreshController refreshController;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoadingMore;
  final bool isLoading;

  const MovieReviewsView(
      {super.key,
        required this.isLoading,
      required this.reviews,
      this.onTap,
      required this.enablePullUp,
      required this.enablePullDown,
      required this.header,
      required this.refreshController,
      this.onRefresh,
      this.onLoadingMore});


  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return reviews.isEmpty 
        ? Center(
      child: TXTextWidget(R.string.noReviews, fontSize: 16),
    )
        : SmartRefresher(
      header: header,
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      onLoading: onLoadingMore,
      onRefresh: onRefresh,
      controller: refreshController, child: ListView.separated(
        padding: const EdgeInsets.all(15),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final model = reviews[index];
          return Skeletonizer(
            enabled: isLoading,
            child: InkWell(
              onTap: onTap != null ? () {
                onTap!(model);
              } : null,
              child: ListTile(
                leading: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.zero,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: model.authorDetails.avatarPath.isNullOrEmpty()
                          ? Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(
                                    AppImages.user),
                                fit: BoxFit.cover),
                            color: isDarkMode
                                ? AppColors.grayDark
                                : AppColors.grayLight,
                          ))
                          : TXCachedNetworkImage(
                        fit: BoxFit.fill,
                        placeholder: Container(
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage(
                                      AppImages.user),
                                  fit: BoxFit.cover),
                              color: isDarkMode
                                  ? AppColors.grayDark
                                  : AppColors.grayLight,
                            )),
                        imageUrl:
                        "${Endpoint.imageUrl500}${model.authorDetails.avatarPath}",
                      ),
                    ),
                  ),
                ),
                title: ReadMoreText(
                  model.content,
                  trimLines: 5,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: R.string.showMore,
                  trimExpandedText: R.string.showLess,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                ),
                subtitle: TXTextWidget(
                  model.author,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          );
        }, separatorBuilder: (BuildContext context, int index) { 
          return const Divider();
    },));
  }
}
