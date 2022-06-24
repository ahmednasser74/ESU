import 'package:esu/core/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerItemWidget extends StatefulWidget {
  const VideoPlayerItemWidget({Key? key, required this.videoId})
      : super(key: key);
  final String videoId;

  @override
  VideoPlayerItemWidgetState createState() => VideoPlayerItemWidgetState();
}

class VideoPlayerItemWidgetState extends State<VideoPlayerItemWidget> {
  late YoutubePlayerController _controller;
  // bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: SizedBox(
        width: 300.w,
        child: YoutubePlayerBuilder(
          onExitFullScreen: () {
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          },
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25.0,
                ),
                onPressed: () {},
              ),
            ],
            onReady: () {
              // _isPlayerReady = true;
            },
            onEnded: (data) {
              HelperMethod.showToast(msg: 'Video Ended!');
            },
          ),
          builder: (_, child) => Container(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }
}
