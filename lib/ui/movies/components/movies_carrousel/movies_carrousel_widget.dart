
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/images.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_cached_image.dart';
import 'package:tmdb_viewer/ui/_widgets/tx_text_widget.dart';
import 'package:tmdb_viewer/utils/extensions.dart';

import '../../../../res/values/colors.dart';

class MoviesCarrouselWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final List<Movie> movies;
  final ValueChanged<Movie>? onTap;

  const MoviesCarrouselWidget({super.key, required this.movies, required this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              icon == null ? Container() : Icon(
                icon!,
                size: 30,
                color: AppColors.grayDarkest,
              ),
              SizedBox(
                width: icon == null ? 0 : 10,
              ),
              Expanded(
                child: TXTextWidget(
                  title,
                  fontSize: 20,
                  textOverFlow: TextOverflow.ellipsis,
                  textColor: AppColors.grayDarkest,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(left: 15, top: 10),
                width: 120,
                height: 150,
                child: InkWell(
                  onTap: movies[index].id == -1 ? null : () {
                    if(onTap != null) {
                      onTap!(movies[index]);
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: movies[index].posterPath.isNullOrEmpty()
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
                      imageUrl: "${Endpoint.imageUrl500}${movies[index].posterPath}",
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }


}