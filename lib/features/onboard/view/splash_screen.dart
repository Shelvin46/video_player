import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player_app/core/extensions/page_navigation_extension.dart';
import 'package:video_player_app/features/video_player/view/video_list_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
            onEnd: () {
              context.pushReplacementWithTransition(
                const VideoListScreens(),
                PageTransitionType.fade,
              );
            },
            curve: Curves.easeIn,
            duration: const Duration(seconds: 3),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, size, child) {
              return Opacity(
                opacity: size,
                child: Text(
                  'Video Player',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              );
            }),
      ),
    );
  }
}
