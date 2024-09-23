import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  //TODO: Repository: El que permite lanzar las peticiones,
  //TODO: DataSource: Fuente de la data que permite tener varias. Data local, data por internet, json local, etc.

  final VideoPostRepository videosRepository;

  bool initialLoading =
      true; //Al cargar la app debe ponerse a cargar los videos.
  List<VideoPost> videos = [];

  DiscoverProvider({required this.videosRepository});

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    //final List<VideoPost> newVideos = videoPosts
    //    .map((video) => LocalVideoModel.fromJSONMap(video).toVideoPostEntity())
    //    .toList(); //Similar al map de js, barre cada uno de los elementos y se aplica una funcion.

    //Por que arriba no se usa el constructor??
    //Por los null que pueden obtenerse, ademas por los datasource ya traen los datos tratados y convertidos.
    final newVideos = await videosRepository.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
