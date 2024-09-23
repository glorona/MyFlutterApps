import 'package:toktik/domain/entities/video_post.dart';

abstract class VideoPostRepository { //El repository llama al datasource.
//Se deberia facilmente poder cambiar el origen de datos
  Future<List<VideoPost>> getTrendingVideosByPage(int page);

  Future<List<VideoPost>> getFavoriteVideosByUser(String userID);
}
