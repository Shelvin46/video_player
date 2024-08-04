import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_app/config/app_them_config.dart';
import 'package:video_player_app/features/video_player/controller/video_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: unused_local_variable
  final VideoController videoController = Get.put(VideoController());
  runApp(MyApp());
}
