import 'package:flutter/material.dart';
import 'package:tiktok_clone/domain/domain.dart';
import 'package:tiktok_clone/presentation/widgets/widgets.dart';

class VideoScrollableView extends StatelessWidget {

  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return VideoContent(video: video);
      },
    );
  }
}

class VideoContent extends StatelessWidget {

  final VideoPost video;

  const VideoContent({
    super.key,
    required this.video
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // Video Player
        SizedBox.expand(
          child: FullScreenPlayer( videoUrl: video.url, caption: video.caption, ),
        ),

        // Buttons
        Positioned(
          bottom: 40,
          right: 20,
          child: VideoButtons(video: video)
        )

      ],
    );
  }
}