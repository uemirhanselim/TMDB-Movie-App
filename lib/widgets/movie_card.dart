import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/utils/extensions/image_launch.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.url,
    required this.rate,
    required this.name,
  }) : super(key: key);

  final String url;
  final num rate;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            imageUrl: url.imagePath,
            maxHeightDiskCache: 200,
            imageBuilder: (context, imageProvider) => Container(
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 5),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  name,
                  maxLines: 2,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                color: Colors.orangeAccent.shade700,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Text(
                    '$rate',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
