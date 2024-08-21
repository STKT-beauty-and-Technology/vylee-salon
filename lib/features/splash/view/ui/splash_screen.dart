import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:vylee_partner/navigation/navigation.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import '../../../../core/path/image_path.dart';
import '../../../../themes/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(ImagePath.splashVideo)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
        setState(() {});
      });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushNamed(PageRoutes.getStarted);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appViolet,
        body: Center(
          child: _controller.value.isInitialized
              ? Builder(builder: (context) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                })
              : Container(),
        )
        );
  }
}
