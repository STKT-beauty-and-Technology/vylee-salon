import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/themes/app_colors.dart';

import '../../core/load_image/image_loader.dart';
import '../../core/path/image_path.dart';
import '../../core/responsive/size_config.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 80),
            child: Center(
                child: Text("WELCOME",
                    style: TextStyle(
                      color: AppColors.appViolet,
                      fontSize: 60,

                    ))),
          ),
          const Center(
              child: Text("AKINA",
                  style: TextStyle(
                    color: AppColors.appViolet,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ))),
          Container(
            color: AppColors.appViolet,
            child: Stack(
              children: [
                Positioned(
                  left: SizeConfig.widthMultiplier! * 10,
                  top: SizeConfig.screenHeight! * 0.3,
                  child: Image.asset(
                    ImagePath.welcomeBg,
                    width: SizeConfig.screenWidth! * 0.95,
                    height: SizeConfig.screenHeight! * 0.68,
                    fit: BoxFit.fill,
                  ),
                ),
                Center(
                  child: UnconstrainedBox(
                    child: SizedBox(
                      width: SizeConfig.widthMultiplier! * 300,
                      height: SizeConfig.screenHeight,
                      // child: Column(
                      //   children: [
                      //     SvgPicture.asset(ImagePath.avatarIcon),
                      //   ],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
