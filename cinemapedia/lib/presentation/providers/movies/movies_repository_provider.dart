import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//La data que contiene no cambia

//Provider de solo lectura, inmutable...

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(datasource: MovieDbDatasource());
});
