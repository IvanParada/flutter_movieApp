import 'package:animate_do/animate_do.dart';
import 'package:app_pelicula/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../search/search_delegate.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text('Películas en cine'),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()),
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),
              BounceInLeft(
                child: MovieSlider(
                  movies: moviesProvider.popularMovies,
                  title: 'Populares',
                  onNextPage: () => moviesProvider.getPopularMovies(),
                ),
              ),
              BounceInLeft(
                child: MovieSlider(
                  movies: moviesProvider.topRatedMovies,
                  title: 'Mejores Calificadas',
                  onNextPage: () => moviesProvider.getTopRatedMovies(),
                ),
              ),
              BounceInLeft(
                child: MovieSlider(
                  movies: moviesProvider.upComingMovies,
                  title: 'Próximas películas',
                  onNextPage: () => moviesProvider.getUpComingMovies(),
                ),
              ),
            ],
          ),
        ));
  }
}
