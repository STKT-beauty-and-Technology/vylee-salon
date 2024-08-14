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

        // Stack(
        //   alignment: Alignment.center,
        //   clipBehavior: Clip.none,
        //   children: [
        //     Positioned(
        //       top: 80,
        //       child: Transform.scale(
        //         scale: 2,
        //         child: Container(
        //           width: sz.width,
        //           height: sz.width,
        //           decoration: BoxDecoration(
        //               color: AppColors.splashBgColor,
        //               borderRadius: BorderRadius.circular(200)),
        //         ),
        //       ),
        //     ),
        //     Positioned.fill(
        //         child: Align(
        //           alignment: Alignment.center,
        //           child: Column(
        //             mainAxisSize: MainAxisSize.min,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               ImageLoader.asset(
        //                 ImagePath.vyleeLogo,
        //                 height: 140,
        //                 width: 140,
        //                 fit: BoxFit.contain,
        //               ),
        //               ImageLoader.asset(
        //                 ImagePath.vyleeTextLogo,
        //                height: 100 ,
        //                 width: 180 ,
        //               )
        //             ],
        //           ),
        //         )).animate().fadeIn(
        //         begin: 0,
        //         curve: Curves.easeInOut,
        //         delay: animationDuration - 400.milliseconds),
        //     Positioned(
        //       bottom: 0,
        //       child: ImageLoader.asset(
        //         ImagePath.vyleeSplashBottom,
        //       ),
        //     ).animate().moveY(
        //         begin: 300,
        //         end: 0,
        //         duration: animationDuration,
        //         curve: Curves.easeInOut),
        //   ],
        // ),
        );
  }
}
