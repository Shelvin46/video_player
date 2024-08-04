// import 'package:awesome_extensions/awesome_extensions.dart'as awesome;
import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import 'package:get/get.dart';
import 'package:video_player_app/features/video_player/controller/video_controller.dart';

class VideoPlayerScreen extends StatelessWidget {
  VideoPlayerScreen({super.key});

  final videoController = Get.find<VideoController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        videoController.videoPlayerController.value.dispose();
        videoController.betterPlayerController.value.dispose();
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
            // controller.videoPlayerController.value.play();≥
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: controller
                            .videoPlayerController.value.value.aspectRatio,
                        child: BetterPlayer(
                          controller: controller.betterPlayerController.value,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
