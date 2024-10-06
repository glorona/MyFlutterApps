import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDBKey,
        'language': 'en-US'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing'); //Recibir json

    final movieDBResponse =  MovieDbResponse.fromJson(response.data); //objeto movieDBresponse
    
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster') //Evitar tener que renderizar peliculas sin poster
    .map(
      (movieDb) => MovieMapper.movieDBToEntity(movieDb) //mapearlo con moviemapper creado.
    ).toList();
    
    return movies;
  }
}
