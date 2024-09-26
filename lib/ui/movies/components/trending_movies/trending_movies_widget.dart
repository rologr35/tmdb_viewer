

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/constants.dart';
import 'package:tmdb_viewer/ui/_base/error_handler.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_cached_image.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/ui/movies/components/trending_movies/trending_movies_controller.dart';
import 'package:tmdb_viewer/utils/extensions.dart';

import '../../../../utils/logger.dart';

class TrendingMoviesWidget extends GetResponsiveWidget<TrendingMoviesController> {

  final List<Movie> movies;

  TrendingMoviesWidget({super.key, required this.movies});


  @override
  Widget build(BuildContext context) {
    return ObxValue<RxInt>((idx) => Column(
      children: [
        SizedBox(
          height: 450,
          child: PageView.builder(
            controller: controller.pageController,
            onPageChanged: (index) {
              idx.value = index;
            },
            itemCount: movies.length > 7 ? 7 : movies.length,
            itemBuilder: (context, index) {
              return Obx(() => _trendingItemsWidget(context, index, controller.position.value!));
            },
          ),
        ),
        const SizedBox(height: 10.0),
        DotsIndicator(
          dotsCount: 7,
          position: idx.value,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: AppColors.primary,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    ), 0.obs);
  }


  Widget _trendingItemsWidget(BuildContext context, int index, double position) {
    final movieDesc = movies[index].overview;
    Matrix4 matrix = Matrix4.identity();
    if (index == position.floor()) {
      var currScale = 1 - (position - index) * (1 - controller.scaleFactor);
      var currTrans = controller.height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == position.floor() + 1) {
      var currScale = controller.scaleFactor + (position - index + 1) * (1 - controller.scaleFactor);
      var currTrans = controller.height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else if (index == position.floor() - 1) {
      var currScale = 1 - (position - index) * (1 - controller.scaleFactor);
      var currTrans = controller.height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = controller.height * (1 - controller.scaleFactor) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(1, currTrans, 1);
    }

    return Transform(
      transform: matrix,
      child: InkWell(
        onTap: () {

        },
        child: Card(
          margin: const EdgeInsets.all(10.0),
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 450,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              image: DecorationImage(
                image: CachedNetworkImageProvider("${Endpoint.imageUrl780}${movies[index].backdropPath}", headers: const {
                  "Authorization": "Bearer ${AppConstants.authToken}"
                }, errorListener: (err) {
                  Logger.log(err);
                }),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(
                  Colors.black26,
                  BlendMode.darken,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Container(
                  height: 25,
                  width: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.orange,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: AppColors.white, size: 13),
                      TXTextWidget(
                        (movies[index].voteAverage).toStringAsFixed(1),
                        textColor: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TXTextWidget(
                  movies[index].title,
                  textColor: AppColors.white,
                ),
                TXTextWidget(
                  movieDesc.length > 100 ? '${movieDesc.substring(0, 100)}...' : movieDesc,
                  fontSize: 12,
                  textColor: AppColors.white,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}