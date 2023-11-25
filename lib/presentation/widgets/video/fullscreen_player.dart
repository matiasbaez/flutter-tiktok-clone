
import 'package:flutter/material.dart';
import 'package:tiktok_clone/presentation/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {

  final String videoUrl;
  final String caption;

  const FullScreenPlayer({
    super.key,
    required this.videoUrl,
    required this.caption
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    // _controller = VideoPlayerController.networkUrl(
    //   Uri.parse(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    //   ),
    // );

    _controller = VideoPlayerController.asset( widget.videoUrl )
      ..setVolume(0)
      ..setLooping(true)
      ..play();

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use a FutureBuilder to display a loading spinner while waiting for the
    // VideoPlayerController to finish initializing.
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the video.
          return GestureDetector(
            onTap: () {
              if (_controller.value.isPlaying) {
                _controller.pause();
                return;
              }

              _controller.play();
            },
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: Stack(
                children: [
                  VideoPlayer(_controller),

                  VideoBackground(
                    stops: const [ 0.8, 1.0 ],
                  ),

                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: _VideoCaption(caption: widget.caption)
                  ),
                ]
              ),
            ),
          );
        }

        // If the VideoPlayerController is still initializing, show a
        // loading spinner.
        return const Center(
          child: CircularProgressIndicator( strokeWidth: 2 ),
        );
      },
    );
  }
}

class _VideoCaption extends StatelessWidget {

  final String caption;

  const _VideoCaption({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text( caption, maxLines: 2, style: titleStyle ),
    );
  }
}
