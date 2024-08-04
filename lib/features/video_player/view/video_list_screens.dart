import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_player_app/features/video_player/controller/video_controller.dart';
import 'package:video_player_app/features/video_player/view/video_player_screen.dart';
import 'package:video_player_app/features/video_player/view/widgets/video_tile_widget.dart';

class VideoListScreens extends StatefulWidget {
  const VideoListScreens({super.key});

  @override
  State<VideoListScreens> createState() => _VideoListScreensState();
}

class _VideoListScreensState extends State<VideoListScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            10.0.heightBox,
            GetX<VideoController>(builder: (controller) {
              if (controller.videos.isEmpty) {
                return Center(
                  child: Text(
                    "No Videos",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                );
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.videos.length,
                itemBuilder: (context, index) {
                  final video = controller.videos[index];
                  return GestureDetector(
                    onTap: () {
                      context.push(
                        const VideoPlayerScreen(),
                      );
                      controller.playVideo(video.videoUrl);
                    },
                    child: VideoTile(
                      title: video.videoTitle,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            }),
          ],
        ),
      )),
    );
  }
}
