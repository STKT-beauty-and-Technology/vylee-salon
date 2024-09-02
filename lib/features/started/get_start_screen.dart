import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/themes/app_colors.dart';

import '../../navigation/page_routes.dart';
import '../../utilities/string.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final animationDuration = 1.seconds;

  @override
  void initState() {
    super.initState();
    Future.delayed(animationDuration + 500.milliseconds).then((value) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 33),
              height: 130,
              decoration: const BoxDecoration(color: AppColors.appViolet),
              child: Center(child: Image.asset(ImagePath.vyleeTextLogo)),
            ),
            Image.asset(ImagePath.girlSkin),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PageRoutes.login,
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appViolet,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0),
                child:  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                    child: Text(
                      Constant.getStarted,
                      style: const TextStyle(color: AppColors.white),
                    )),
              ),
            )
            // SvgPicture.asset(ImagePath.curveAsset)
          ],
        ));
  }
}
