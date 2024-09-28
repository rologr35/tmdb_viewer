import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/domain/actor/actor_model.dart';
import 'package:tmdb_viewer/domain/movie/movie_wrapper.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/images.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_genre_chip.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_movie_average.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/utils/datetime_utils.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../res/R.dart';
import 'package:tmdb_viewer/utils/extensions.dart';

import '../../_widgets/tx_cached_image.dart';

class MovieAboutView extends StatelessWidget {
  final MovieWrapper movie;
  final List<Actor> fakeCast;
  final bool isLoading;

  const MovieAboutView(
      {super.key, required this.fakeCast, required this.movie, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 4,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: (MediaQuery.of(context).orientation ==
                                            Orientation.portrait
                                        ? MediaQuery.of(context).size.width
                                        : MediaQuery.of(context).size.height) *
                                    3 /
                                    5 -
                                30,
                            height: (MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? MediaQuery.of(context).size.width
                                    : MediaQuery.of(context).size.height) *
                                3 /
                                5 /
                                0.7,
                            child: movie.movie.posterPath.isNullOrEmpty()
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
                                    fit: BoxFit.fill,
                                    placeholder: Container(
                                        decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image:
                                              AssetImage(AppImages.splashLogo),
                                          fit: BoxFit.cover),
                                      color: isDarkMode
                                          ? AppColors.grayDarkestPlus
                                          : AppColors.grayLight,
                                    )),
                                    imageUrl:
                                        "${Endpoint.imageUrl780}${movie.movie.posterPath}",
                                  ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TXMovieAverage(movie.movie.voteAverage),
                            const SizedBox(height: 15),
                            TXTextWidget(DateTimeUtils.showInFormat(
                                R.string.dateFormat1, movie.movie.releaseDate)),
                            const SizedBox(height: 5),
                            Skeletonizer(
                              enabled: isLoading,
                                child: TXTextWidget(
                                    "${movie.movieDetails?.runtime ?? "-"} mins")),
                            const SizedBox(height: 5),
                            Skeletonizer(
                                enabled: isLoading,
                                ignoreContainers: false,
                                child: isLoading
                                    ? const Icon(Icons.home,
                                    size: 30,
                                    color: AppColors.primary)
                                    : movie.movieDetails?.homepage == null
                                        ? Container()
                                        : InkWell(
                                            onTap: () {
                                              canLaunchUrlString(movie
                                                      .movieDetails!.homepage!)
                                                  .then((v) {
                                                if (v) {
                                                  launchUrlString(movie
                                                      .movieDetails!.homepage!);
                                                }
                                              });
                                            },
                                            child: const Icon(Icons.home,
                                                size: 30,
                                                color: AppColors.primary),
                                          ))
                          ],
                        ),
                      )),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.start,
                    direction: Axis.horizontal,
                    spacing: 10,
                    children: [
                      ...movie.genres.map((e) => TXGenreChip(genre: e.name))
                    ],
                  ),
                  const SizedBox(height: 15),
                  TXTextWidget(R.string.synopsis,
                      fontSize: 15, fontWeight: FontWeight.bold),
                  const SizedBox(height: 5),
                  TXTextWidget(
                    movie.movie.overview,
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.justify,
                  )
                ],
              )),
          const SizedBox(height: 15),
          Skeletonizer(
              enabled: isLoading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TXTextWidget(R.string.cast,
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movie.cast?.length ?? fakeCast.length,
                      itemBuilder: (context, index) {
                        final model = (movie.cast ?? fakeCast)[index];
                        return Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                margin: EdgeInsets.zero,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: SizedBox(
                                    width: 100,
                                    height: 140,
                                    child: model.profilePath.isNullOrEmpty()
                                        ? Container(
                                            decoration: BoxDecoration(
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    AppImages.user),
                                                fit: BoxFit.cover),
                                            color: isDarkMode
                                                ? AppColors.grayDarkestPlus
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
                                                  ? AppColors.grayDarkestPlus
                                                  : AppColors.grayLight,
                                            )),
                                            imageUrl:
                                                "${Endpoint.imageUrl500}${model.profilePath}",
                                          ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TXTextWidget(
                                model.character,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                              TXTextWidget(
                                model.name,
                                fontSize: 10.0,
                                textColor: isDarkMode ? AppColors.gray : AppColors.grayDarkest,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
