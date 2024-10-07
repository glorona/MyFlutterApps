import 'package:cinemapedia/domain/entities/movie.dart';

//Como se diferencian?
//Los repositorios llaman los datasoruces.

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});
  
}
