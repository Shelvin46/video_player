import 'package:equatable/equatable.dart';

class VideoModel extends Equatable {
  final String videoUrl;
  final String videoTitle;
  final String videoDescription;

  const VideoModel({
    required this.videoUrl,
    required this.videoTitle,
    required this.videoDescription,
  });

  @override
  List<Object> get props => [videoUrl, videoTitle, videoDescription];
}
