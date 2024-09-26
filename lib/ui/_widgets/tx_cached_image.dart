
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_viewer/res/values/colors.dart';
import 'package:tmdb_viewer/res/values/constants.dart';

class TXCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final Widget placeholder;
  final double height;
  final double width;
  final BlendMode? blendMode;
  final Color? color;

  const TXCachedNetworkImage(
      {super.key, this.imageUrl = '', this.color, this.blendMode, this.fit = BoxFit.cover, required this.placeholder, this.height = double.infinity, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty
        ? CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      colorBlendMode: blendMode,
      color: color,
      httpHeaders: const {
        "Authorization": "Bearer ${AppConstants.authToken}"
      },
      fit: fit,
      errorWidget: (BuildContext context, String url, dynamic error) {
        return placeholder;
      },
      placeholder: (context, url) {
        return placeholder;
      },
    )
        : placeholder;
  }
}