import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/features/video_player/model/video_model_class.dart';
import 'package:video_player_app/features/video_player/repo/video_fetch_remote_repo.dart';

class VideoController extends GetxController {
  var videos = <VideoModel>[].obs;
  var isLoading = false.obs;
  var error = "".obs;

  var currentVideoIndex = 0.obs;

  var videoPlayerController = VideoPlayerController.networkUrl(
    Uri.parse(""),
  ).obs;

  var chewieController = ChewieController(
    videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(""),
    ),
  ).obs;

  @override
  void onReady() {
    super.onReady();
    getVideos();
  }

  void getVideos() async {
    videos.value = await VideoFetchRemoteRepo.fetchVideos();
  }

  Future<void> playVideo(String videoUrl, int index) async {
    // Play video
    error.value = "";
    isLoading.value = true;
    currentVideoIndex.value = index;

    try {
      if (videoPlayerController.value.value.isInitialized) {
        await videoPlayerController.value.dispose();
      }

      videoPlayerController.value = VideoPlayerController.networkUrl(
        Uri.parse(videoUrl),
      );

      // Check if the controller is already initializing or initialized
      if (!videoPlayerController.value.value.isInitialized) {
        await videoPlayerController.value.initialize();
      }
      isLoading.value = false;
      chewieController.value = ChewieController(
        videoPlayerController: videoPlayerController.value,
        autoPlay: true,
        looping: false,
        hideControlsTimer: const Duration(seconds: 1),
        additionalOptions: (context) {
          return [
            OptionItem(
              iconData: Icons.skip_previous,
              onTap: () {
                playPreviousVideo();
              },
              title: "Previous",
            ),
            OptionItem(
              iconData: Icons.skip_next,
              onTap: () {
                playNextVideo();
              },
              title: "Next",
            ),
          ];
        },
      );
    } catch (e) {
      if (e is HttpException) {
        error.value = "Video not found";
      } else if (e is FormatException) {
        error.value = "Invalid video format";
      } else if (e is SocketException) {
        error.value = "No internet connection";
      } else {
        error.value = "An error occurred";
      }
    } finally {
      isLoading.value = false;
    }
  }

  void playNextVideo() {
    if (currentVideoIndex.value < videos.length - 1) {
      currentVideoIndex.value++;
      playVideo(
        videos[currentVideoIndex.value].videoUrl,
        currentVideoIndex.value,
      );
    }
  }

  void playPreviousVideo() {
    if (currentVideoIndex.value > 0) {
      currentVideoIndex.value--;
      playVideo(
        videos[currentVideoIndex.value].videoUrl,
        currentVideoIndex.value,
      );
    }
  }

  @override
  void onClose() {
    videoPlayerController.value.dispose();
    chewieController.value.dispose();
    super.onClose();
  }
}
