

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/data/api/_remote/endpoints.dart';
import 'package:tmdb_viewer/domain/movie/movie_model.dart';
import 'package:tmdb_viewer/res/values/constants.dart';

class MoviesCarrouselWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final List<Movie> movies;

  const MoviesCarrouselWidget({super.key, required this.movies, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            children: [
              icon == null ? Container() : const Icon(
                Icons.play_circle_outline,
                size: 30,
              ),
              SizedBox(
                width: icon == null ? 0 : 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
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
              return InkWell(
                onTap: () {

                },
                child: Container(
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  child: Container(
                    width: 120,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: CachedNetworkImageProvider("${Endpoint.imageUrl500}${movies[index].backdropPath}", headers: const {
                          "Authorization": "Bearer ${AppConstants.authToken}"
                        }),
                        fit: BoxFit.cover,
                      ),
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