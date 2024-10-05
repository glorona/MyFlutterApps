//Clase abstracta
//Como lucen los origenes de datos que traen peliculas? Esta clase los define.
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieDatasource {
  
  Future<List<Movie>> getNowPlaying({int page= 1});

}
