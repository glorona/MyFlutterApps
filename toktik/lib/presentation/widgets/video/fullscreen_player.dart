import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullscreenPlayer extends StatefulWidget {
  final String videoURL;
  final String caption;

  const FullscreenPlayer(
      {super.key, required this.videoURL, required this.caption});

  @override
  State<FullscreenPlayer> createState() => _FullscreenPlayerState();
}

class _FullscreenPlayerState extends State<FullscreenPlayer> {
  //En state para acceder a los attr del widget se usa widget.
  late VideoPlayerController controller;

  @override
  void initState() {
    //Primero
    super
        .initState(); //El init es lo primero que se hace y el dispose es lo ultimo que se hace siempre. (Del super)

    controller = VideoPlayerController.asset(widget.videoURL)
      ..setVolume(0) //Llama en una sola instruccion. Operador cascada ..
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller
        .dispose(); // Es necesario borrar el controlador por la carga dinamica de videos.

    super.dispose(); //Ultimo
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        //Snapshot es estado del future.

        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              }
              controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(children: [
                VideoPlayer(controller),

                //Gradient

                VideoBackground(stops: const  [0.8,1.0],), //0.8 desde el begin al end

                //Text
                Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(caption: widget.caption))
              ]),
            ),
          );
        }
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
