
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/images.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_cached_image.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_movie_average.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/utils/extensions.dart';


class TrendingMoviesWidget extends StatefulWidget {
  final List<Movie> movies;
  final ValueChanged<Movie>? onTap;

  const TrendingMoviesWidget({super.key, required this.movies, this.onTap});

  @override
  State<StatefulWidget> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMoviesWidget> {

  late PageController pageController;
  final double scaleFactor = 0.8;
  final double height = 300;

  final RxnDouble position = RxnDouble(0.0);
  final RxInt dotIndex = 0.obs;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.85, initialPage: dotIndex.value);
    pageController.addListener(onPageChanged);
  }

  @override
  void dispose() {
    pageController.removeListener(onPageChanged);
    super.dispose();
  }

  void onPageChanged() {
    position.value = pageController.page;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(() => Column(
          children: [
            SizedBox(
              height: 450,
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  dotIndex.value = index;
                },
                itemCount: widget.movies.length > 7 ? 7 : widget.movies.length,
                itemBuilder: (context, index) {
                  return Obx(() => _trendingItemsWidget(
                      context, index, position.value!, isDarkMode));
                },
              ),
            ),
            const SizedBox(height: 10.0),
            DotsIndicator(
              dotsCount: 7,
              position: dotIndex.value,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeColor: AppColors.primary,
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ],
        ));
  }

  Widget _trendingItemsWidget(
      BuildContext context, int index, double position, bool isDarkMode) {
    final movieDesc = widget.movies[index].overview;
    Matrix4 matrix = Matrix4.identity();
    if (index == position.floor()) {
      var currScale = 1 - (position - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == position.floor() + 1) {
      var currScale = scaleFactor +
          (position - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == position.floor() - 1) {
      var currScale = 1 - (position - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = height * (1 - scaleFactor) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(1, currTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: Card(
        margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: InkWell(
          onTap: widget.movies[index].id == -1 ? null : () {
            if(widget.onTap != null) {
              widget.onTap!(widget.movies[index]);
            }
          },
          borderRadius: BorderRadius.circular(30.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: SizedBox(
              height: 450,
              child: Stack(
                children: [
                  widget.movies[index].backdropPath.isNullOrEmpty()
                      ? Container(
                          decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(AppImages.splashLogo),
                              fit: BoxFit.cover),
                          color: isDarkMode
                              ? AppColors.grayDarkestPlus
                              : AppColors.grayLight,
                        ))
                      : TXCachedNetworkImage(
                          placeholder: Container(
                              decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(AppImages.splashLogo),
                                fit: BoxFit.cover),
                            color: isDarkMode
                                ? AppColors.grayDarkestPlus
                                : AppColors.grayLight,
                          )),
                          imageUrl:
                              "${Endpoint.imageUrl780}${widget.movies[index].backdropPath}",
                          color: Colors.black26,
                          blendMode: BlendMode.darken,
                        ),
                  widget.movies[index].id == -1 ? Container() : Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        TXMovieAverage(widget.movies[index].voteAverage),
                        const SizedBox(height: 20),
                        TXTextWidget(
                          widget.movies[index].title,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.white,
                        ),
                        TXTextWidget(
                          movieDesc.length > 100
                              ? '${movieDesc.substring(0, 100)}...'
                              : movieDesc,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.white,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
