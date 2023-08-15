import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/utils/extensions/image_launch.dart';

import '../model/movie.dart';

class DetailsMovieImage extends StatelessWidget {
  const DetailsMovieImage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: movie.posterPath!.imagePath,
      maxHeightDiskCache: 200,
      imageBuilder: (context, imageProvider) => Container(
        height: 240,
        width: 160,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
