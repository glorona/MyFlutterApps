import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) {
    return Actor(id: cast.id,
     name: cast.name, 
     profilePath: cast.profilePath != null ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}':'https://th.bing.com/th/id/OIP.Lr_j_PgqTGzKxJTeIwajVwHaLH?rs=1&pid=ImgDetMain', 
     character: cast.character);
  }
}
