import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/features/video_player/controller/video_controller.dart';

class VideoPlayerScreen extends StatelessWidget {
  VideoPlayerScreen({super.key});

  final videoController = Get.find<VideoController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        videoController.videoPlayerController.value.dispose();
        videoController.chewieController.value.dispose();
      },
      child: Scaffold(
        body: GetX<VideoController>(builder: (controller) {
          if (controller.isLoading.value == true) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    height: context.height * 0.3,
                    width: context.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          "https://www.crowdcontent.com/blog/wp-content/uploads/sites/16/video-take-486x354.png",
                        ),
                      ),
                    ),
                  ),
                ),
                const CircularProgressIndicator()
              ],
            );
          }
          if (controller.error.value.isNotEmpty) {
            return Center(
              child: Text(
                controller.error.value,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            );
          } else {
            return SafeArea(
              child: Column(children: [
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: controller
                          .videoPlayerController.value.value.aspectRatio,
                      child: Chewie(
                        controller: controller.chewieController.value,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: controller.videoPlayerController.value,
                      builder: (context, VideoPlayerValue value, child) {
                        return Text(
                          _formatDuration(value.position),
                        );
                      },
                    ),
                    10.widthBox,
                    Expanded(
                      child: VideoProgressIndicator(
                        controller.videoPlayerController.value,
                        allowScrubbing: true,
                      ),
                    ),
                    10.widthBox,
                    ValueListenableBuilder(
                      valueListenable: controller.videoPlayerController.value,
                      builder: (context, VideoPlayerValue value, child) {
                        return Text(
                          _formatDuration(value.duration),
                        );
                      },
                    ),
                  ],
                ),
                // 10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.playPreviousVideo();
                      },
                      icon: const Icon(
                        Icons.skip_previous,
                        size: 34,
                      ),
                    ),
                    10.widthBox,
                    IconButton(
                      onPressed: () {
                        controller.videoPlayerController.value.seekTo(
                          controller
                                  .videoPlayerController.value.value.position -
                              const Duration(seconds: 10),
                        );
                      },
                      icon: const Icon(
                        Icons.replay_10_rounded,
                        size: 34,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: controller.videoPlayerController.value,
                      builder: (context, VideoPlayerValue value, child) {
                        return IconButton(
                          onPressed: () {
                            value.isPlaying
                                ? controller.videoPlayerController.value.pause()
                                : controller.videoPlayerController.value.play();
                          },
                          icon: value.isPlaying
                              ? const Icon(
                                  Icons.pause_rounded,
                                  size: 50,
                                )
                              : const Icon(
                                  Icons.play_arrow_rounded,
                                  size: 50,
                                ),
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        controller.videoPlayerController.value.seekTo(
                          controller
                                  .videoPlayerController.value.value.position +
                              const Duration(seconds: 10),
                        );
                      },
                      icon: const Icon(
                        Icons.forward_10_rounded,
                        size: 34,
                      ),
                    ),
                    10.widthBox,
                    IconButton(
                      onPressed: () {
                        controller.playNextVideo();
                      },
                      icon: const Icon(
                        Icons.skip_next,
                        size: 34,
                      ),
                    ),
                  ],
                ),
              ]),
            );
          }
        }),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }
}
