import 'package:flutter/material.dart';
import 'package:tmdb_movie_app/viewModel/home_view_model.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key, required this.viewModel,
  }) : super(key: key);
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff34353e),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        height: 50,
        child:  TextField(
          onChanged: (value) => viewModel.onChangeFilter(value),
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
