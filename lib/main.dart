import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_movie_app/view/home_view.dart';
import 'package:tmdb_movie_app/viewModel/detail_view_model.dart';
import 'package:tmdb_movie_app/viewModel/home_view_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ChangeNotifierProvider(create: (context) => DetailViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMDB Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  color: Colors.white, fontSize: 16, letterSpacing: 1.2)),
        ),
      ),
      home: const HomeView(),
    );
  }
}
