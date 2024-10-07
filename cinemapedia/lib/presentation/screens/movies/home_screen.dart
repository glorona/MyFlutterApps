import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottonNavigationbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref
        .read(nowPlayingMoviesProvider.notifier)
        .loadNextPage(); //Dentro de un metodo es read

    ref.read(popularMoviesProvider.notifier).loadNextPage();

    ref.read(topRatedMoviesProvider.notifier).loadNextPage();

    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) return FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    final movieSlProvider = ref.watch(moviesSlideshowProvider);

    final popularMovies = ref.watch(popularMoviesProvider);

    final topMovies = ref.watch(topRatedMoviesProvider);

    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    
        //SingleChildScrollView tambien se puede
    return  Visibility(
      visible: !initialLoading,
      child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(0),
                    title: CustomAppbar(),
                  ),
                ),
      
                //Delegate es la funcion para crear los slivers.
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                  return Column(
                    children: [
                      MoviesSlideshow(movies: movieSlProvider),
                      MovieHorizontalListview(
                        movies: nowPlayingMovies,
                        label: 'Now playing on cinemas',
                        caption: 'Monday 7',
                        loadNextPage: () {
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MovieHorizontalListview(
                        movies: upcomingMovies,
                        label: 'Coming soon',
                        //caption: 'Monday 7',
                        loadNextPage: () {
                          ref
                              .read(upcomingMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MovieHorizontalListview(
                        movies: topMovies,
                        label: 'Top rated movies',
                        //caption: 'Monday 7',
                        loadNextPage: () {
                          ref
                              .read(topRatedMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MovieHorizontalListview(
                        movies: popularMovies,
                        label: 'Popular movies',
                        //caption: 'Monday 7',
                        loadNextPage: () {
                          ref.read(popularMoviesProvider.notifier).loadNextPage();
                        },
                      ),
                      const SizedBox(height: 10)
                    ],
                  );
                }, childCount: 1))
              ], //Widgets que trabaja directamente con el scrollview
            ),
    );
  }
}
