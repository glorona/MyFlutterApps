import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String caption;
  final String videoURL;
  final int views;
  final int likes;

  LocalVideoModel(
      {required this.caption,
      required this.videoURL,
      this.views = 0,
      this.likes = 0});

  //Mapper de VideoPost a LocalVideoModel
  factory LocalVideoModel.fromJSONMap(Map<String, dynamic> json) =>
      LocalVideoModel(
          caption: json['name'] ?? 'No video name',
          videoURL: json['videoUrl'] ?? 'No video URL.',
          views: json['views'] ?? 0,
          likes: json['likes'] ?? 0);

  VideoPost toVideoPostEntity() =>
      VideoPost(
        caption: caption, 
        videoURL: videoURL, likes: likes, views: views);
}
