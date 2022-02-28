import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:prueba_app/search/search_delegate.dart';
import 'package:prueba_app/providers/movies_provider.dart';
import 'package:prueba_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Películas'),
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MovieSlider(
                movies: moviesProvider.popularMovies,
                title: 'Lista', // opcional
                onNextPage: () => moviesProvider.getPopularMovies(),
              ),
            ],
          ),
        ));
  }
}
