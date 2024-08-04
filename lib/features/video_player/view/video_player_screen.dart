import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
// import 'package:get/get.dart';
import 'package:video_player_app/features/video_player/controller/video_controller.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          return Text(
            controller.error.value,
            style: Theme.of(context).textTheme.displayMedium,
          ).toCenter();
        } else {
          controller.videoPlayerController.value.play();
          return Center(
            child: AspectRatio(
              aspectRatio:
                  controller.videoPlayerController.value.value.aspectRatio,
              child: Chewie(controller: controller.chewieController.value),
            ),
          );
        }
      }),
    );
  }
}
