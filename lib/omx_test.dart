import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
// import 'package:omxplayer_video_player/omxplayer_video_player.dart';

class OmxTest extends StatefulWidget {
  const OmxTest({Key? key}) : super(key: key);

  @override
  State<OmxTest> createState() => _OmxTestState();
}

class _OmxTestState extends State<OmxTest> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller =
        VideoPlayerController.asset('assets/images/sample-mp4-file.mp4')
          ..initialize().then((value) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            )
          : Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            controller.value.isPlaying ? controller.pause() : controller.play();
          });
        },
        child:
            Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
