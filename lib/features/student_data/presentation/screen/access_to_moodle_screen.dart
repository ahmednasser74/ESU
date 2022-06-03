import 'package:boilerplate/core/src/widgets/conditional_builder.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/horizontal_list_builder.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/student_data/presentation/controller/access_to_moodle_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player/video_player.dart';

class AccessToMoodleScreen extends GetView<AccessToMoodleController> {
  const AccessToMoodleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Access to Moodle')),
      body: Obx(
        () => ConditionalBuilder(
          condition: controller.isLoading.value,
          builder: (_) => const LoadingIndicatorWidget(),
          fallback: (_) => ConditionalBuilder(
            condition: controller.isError.value,
            builder: (_) => AppErrorWidget(
              errorMessage: controller.errorMessage.value,
            ),
            fallback: (_) => Column(
              children: [
                HorizontalListBuilder(
                  itemCount: controller.filesList.length,
                  heightList: .40.sh,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1.w,
                          blurRadius: 2.w,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        controller.filesList.elementAt(index),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                HorizontalListBuilder(
                  itemCount: controller.videosList.length,
                  heightList: .30.sh,
                  itemBuilder: (_, index) => VideoPlayerItemWidget(
                    videoUrl: controller.videosList.elementAt(index),
                  ),
                ),
                SizedBox(height: 12.h),
                AppButton(
                  title: 'Go to Moodle',
                  onPressed: () => HelperMethod.launchToBrowser(
                    controller.moodleUrl.value,
                  ),
                ),
              ],
            ),
          ),
        ),
      ), // body: controller.obx(
    );
  }
}

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
