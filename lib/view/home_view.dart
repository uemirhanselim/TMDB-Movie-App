import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/viewModel/home_view_model.dart';

import '../model/movie.dart';
import '../widgets/movie_card.dart';
import '../widgets/searchbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1c1c27),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            List<Movie>? movies = viewModel.movies;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SearchBar(viewModel: viewModel),
                  Expanded(
                    child: _gridView(viewModel, movies),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  GridView _gridView(HomeViewModel viewModel, List<Movie> movies) {
    return GridView.builder(
      controller: viewModel.controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 290,
          mainAxisSpacing: 24),
      physics: const BouncingScrollPhysics(),
      itemCount: viewModel.isLoadingMore ? movies.length + 1 : movies.length,
      itemBuilder: (context, index) {
        if (index < movies.length) {
          return InkWell(
            onTap: () => viewModel.goToDetails(context, movies[index]),
            child: MovieCard(
              name: movies[index].title ?? 'Could not fetch',
              rate: movies[index].voteAverage ?? 0,
              url: movies[index].posterPath ??
                  'https://www.shutterstock.com/image-vector/caution-exclamation-mark-white-red-260nw-1055269061.jpg',
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 40),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
