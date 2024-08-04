import 'package:video_player_app/features/video_player/model/video_model_class.dart';

class VideoFetchRemoteRepo {
  static Future<List<VideoModel>> fetchVideos() async {
    // await Future.delayed(const Duration(seconds: 2));
    return videos;
  }
}

List<VideoModel> videos = [
  const VideoModel(
      videoDescription: "",
      videoTitle: "Big Buck Bunny",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "Elephants Dream",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "For Bigger Blazes",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "For Bigger Escape",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "For Bigger Fun",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "For Bigger Joyrides",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "For Bigger Meltdowns",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "Sintel",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "Subaru Outback On Street And Dirt",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "Tears of Steel",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "We Are Going On Bullrun",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"),
  const VideoModel(
      videoDescription: "",
      videoTitle: "What Car Can You Get For A Grand",
      videoUrl:
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WhatCarCanYouGetForAGrand.mp4"),
];
