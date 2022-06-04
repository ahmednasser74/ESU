import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItemWidget extends StatefulWidget {
  const VideoPlayerItemWidget({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  final String videoUrl;

  @override
  _VideoPlayerItemWidgetState createState() => _VideoPlayerItemWidgetState();
}

class _VideoPlayerItemWidgetState extends State<VideoPlayerItemWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.value.isPlaying ? _controller.pause() : _controller.play();
        setState(() {});
      },
      child: Container(
        width: 200.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.w,
              blurRadius: 2.w,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
            Center(
              child: _controller.value.isPlaying
                  ? const SizedBox()
                  : Icon(Icons.play_arrow, size: 60.r),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
