import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      //Permite scroll a pantalla completa
      physics: const BouncingScrollPhysics(), //Para Android
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            //Video player + Gradient
            SizedBox.expand(
              child: FullscreenPlayer(
                caption: videoPost.caption,
                videoURL: videoPost.videoURL,
              )
            ),


            //Buttons
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost))
          ],
        );
      },
    );
  }
}
