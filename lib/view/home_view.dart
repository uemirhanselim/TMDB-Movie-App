import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/viewModel/home_view_model.dart';

import '../model/movie.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff1c1c27),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            return FutureBuilder(
              future: viewModel.getMovies(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Movie>? movies = snapshot.data;
                  return Container();
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff34353e),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 50,
        child: const TextField(
          style: TextStyle(color: Color(0xff6b6d71), fontSize: 20),
          decoration: InputDecoration(
            hintText: "Search movie...",
            hintStyle: TextStyle(color: Color(0xff6b6d71), fontSize: 20),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff6b6d71),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
          ),
          const Positioned(
            bottom: 20,
            left: 20,
            child: Text("Movie Name"),
          ),
          const Positioned(
            bottom: 40,
            right: 20,
            child: Text("6.8"),
          )
        ],
      ),
    );
  }
}


/*

FutureBuilder(
            future: viewModel.getMovies(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Movie>? movies = snapshot.data;
                print("DATA => ${movies?[0]}");
                return Container(
                  height: 100,
                  width: 100,
                  color: Colors.red,
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );





Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SearchBar(),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisExtent: 220,
                              mainAxisSpacing: 10),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const MovieCard();
                      },
                    ),
                  ),
                ],
              ),
            );




 */
