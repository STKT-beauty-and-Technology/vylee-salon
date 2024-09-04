import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
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
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: -85,
              right: -85,
              child: Container(
                decoration: const BoxDecoration(color: AppColors.appGray),
                height: SizeConfig.screenHeight,
                child: Column(
                  children: [
                    const Spacer(),
                    Image.asset(
                      ImagePath.girlSkin,
                      height: SizeConfig.screenHeight! * 0.75,
                      color: AppColors.appGray,
                      colorBlendMode: BlendMode.darken,
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomCenter,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Center(
                        child: Image.asset(
                      ImagePath.vyleeTextLogo,
                      height: 80,
                      width: SizeConfig.screenWidth! * 0.7,
                      fit: BoxFit.fill,
                    )),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.4,
                    height: 50,
                    child: CustomButton(
                      text: Constant.getStarted,
                      bgcolor: AppColors.white,
                      textStyle: GoogleFonts.libreBodoni(
                          color: AppColors.black, fontWeight: FontWeight.w400),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          PageRoutes.login,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.pushNamed(
            //         context,
            //         PageRoutes.login,
            //       );
            //     },
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: AppColors.appViolet,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(8)),
            //         elevation: 0),
            //     child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 8.0, vertical: 10.0),
            //         child: Text(
            //           Constant.getStarted,
            //           style: const TextStyle(color: AppColors.white),
            //         )),
            //   ),
            // )
            // SvgPicture.asset(ImagePath.curveAsset)
          ],
        ));
  }
}
