

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../themes/app_colors.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final animationDuration = 1.seconds;
  @override
  void initState() {
    super.initState();
    Future.delayed(animationDuration + 500.milliseconds)
        .then((value) => {initialFunction()});
  }

  initialFunction() async {
  }

  @override
  Widget build(BuildContext context) {
    final sz = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.green20,
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 80,
            child: Transform.scale(
              scale: 2,
              child: Container(
                width: sz.width,
                height: sz.width,
                decoration: BoxDecoration(
                    color: AppColors.splashBgColor,
                    borderRadius: BorderRadius.circular(200)),
              ),
            ),
          ),
          Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageLoader.asset(
                      ImagePath.vyleeLogo,
                      height: 140,
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                    ImageLoader.asset(
                      ImagePath.vyleeTextLogo,
                     height: 100 ,
                      width: 180 ,
                    )
                  ],
                ),
              )).animate().fadeIn(
              begin: 0,
              curve: Curves.easeInOut,
              delay: animationDuration - 400.milliseconds),
          Positioned(
            bottom: 0,
            child: ImageLoader.asset(
              ImagePath.vyleeSplashBottom,
            ),
          ).animate().moveY(
              begin: 300,
              end: 0,
              duration: animationDuration,
              curve: Curves.easeInOut),
        ],
      ),
    );
  }
}
