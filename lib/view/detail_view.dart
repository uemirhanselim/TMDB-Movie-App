import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/genre.dart';
import '../model/movie.dart';
import '../viewModel/detail_view_model.dart';
import '../widgets/details_movie_image.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1c27),
      appBar: _appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsMovieImage(movie: movie),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _infoLine(context, Icons.visibility_sharp,
                          "${movie.popularity} (Views)"),
                      _infoLine(context, Icons.arrow_upward,
                          '${movie.voteCount} (Votes)'),
                      _infoLine(
                          context, Icons.star, '${movie.voteAverage} (IMDB)'),
                      _infoLine(context, Icons.language,
                          movie.originalLanguage.toString().toUpperCase()),
                      _infoLine(context, Icons.date_range_outlined,
                          movie.releaseDate.toString()),
                    ],
                  ),
                ),
              ],
            ),
            Consumer<DetailViewModel>(
              builder: (context, viewModel, child) {
                return FutureBuilder(
                  future: viewModel.getGenres(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Genre> genres = snapshot.data!;
                      return _listView(genres, viewModel);
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(movie.overview.toString(),
                  style: Theme.of(context).textTheme.headline4),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _listView(List<Genre> genres, DetailViewModel viewModel) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: movie.genreIds!.length,
        itemBuilder: (context, index) {
          for (int i = 0; i < genres.length; i++) {
            if (genres[i].id == movie.genreIds![index]) {
              viewModel.chosedGenres.add(genres[i].name);
            }
          }
          return Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: Chip(label: Text(viewModel.chosedGenres[index]!)),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff1c1c27),
      leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back)),
      title: Text(
        movie.title!,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontSize: 20, letterSpacing: 0.4),
      ),
    );
  }

  Widget _infoLine(BuildContext context, IconData iconData, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.orangeAccent.shade700,
            size: 22,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style:
                Theme.of(context).textTheme.headline4?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
