import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/themes/app_colors.dart';

import '../../data/local/vendorId_provider.dart';
import '../../navigation/page_routes.dart';
import '../../utilities/string.dart';

class GetStarted3 extends StatefulWidget {
  const GetStarted3({super.key});

  @override
  State<GetStarted3> createState() => _GetStarted3State();
}

class _GetStarted3State extends State<GetStarted3> {
  DateTime? currentBackPressTime;
  final animationDuration = 1.seconds;
  int? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appGray,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 400,
                width: double.infinity,
                child: Image.asset(ImagePath.get3, fit: BoxFit.cover)),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "ALL YOUR",
                    style: TextStyle(
                        fontSize: 40, color: AppColors.themeColorPink),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Text(
                    "Salon needs in one place",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.w600,
                        color: AppColors.themeColorPink),
                  )
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () async {
                id = await VendorIdProvider.getVendorId();
                id == null
                    ? Navigator.pushNamed(
                        context,
                        PageRoutes.login,
                      )
                    : Navigator.pushNamed(context, PageRoutes.homeScreen,
                        arguments: {Constant.name: id.toString()});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.themeColorPink,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
        // Stack(
        //   children: [
        //     Positioned(
        //       bottom: 0,
        //       left: -85,
        //       right: -85,
        //       child: Container(
        //         decoration: const BoxDecoration(color: AppColors.appGray),
        //         height: SizeConfig.screenHeight,
        //         child: Column(
        //           children: [
        //             const Spacer(),
        //             Image.asset(
        //               ImagePath.girlSkin,
        //               height: SizeConfig.screenHeight! * 0.75,
        //               color: AppColors.appGray,
        //               colorBlendMode: BlendMode.darken,
        //               fit: BoxFit.fill,
        //               alignment: Alignment.bottomCenter,
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(top: 70, bottom: 60),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           Center(
        //             child: Center(
        //                 child: Image.asset(
        //               ImagePath.vyleeTextLogo,
        //               height: 50,
        //               width: SizeConfig.screenWidth! * 0.55,
        //               fit: BoxFit.fill,
        //             )),
        //           ),
        //           SizedBox(
        //             width: SizeConfig.screenWidth! * 0.5,
        //             height: 50,
        //             child: CustomButton(
        //               text: Constant.getStarted,
        //               bgcolor: AppColors.white,
        //               textStyle: GoogleFonts.libreBodoni(
        //                   color: AppColors.black,
        //                   fontWeight: FontWeight.w400),
        //               onPressed: () async {
        //                 id = await VendorIdProvider.getVendorId();
        //                 id == null
        //                     ? Navigator.pushNamed(
        //                         context,
        //                         PageRoutes.login,
        //                       )
        //                     : Navigator.pushNamed(
        //                         context, PageRoutes.homeScreen,
        //                         arguments: {Constant.name: id.toString()});
        //               },
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //     // Center(
        //     //   child: ElevatedButton(
        //     //     onPressed: () {
        //     //       Navigator.pushNamed(
        //     //         context,
        //     //         PageRoutes.login,
        //     //       );
        //     //     },
        //     //     style: ElevatedButton.styleFrom(
        //     //         backgroundColor: AppColors.appViolet,
        //     //         shape: RoundedRectangleBorder(
        //     //             borderRadius: BorderRadius.circular(8)),
        //     //         elevation: 0),
        //     //     child: Padding(
        //     //         padding: const EdgeInsets.symmetric(
        //     //             horizontal: 8.0, vertical: 10.0),
        //     //         child: Text(
        //     //           Constant.getStarted,
        //     //           style: const TextStyle(color: AppColors.white),
        //     //         )),
        //     //   ),
        //     // )
        //     // SvgPicture.asset(ImagePath.curveAsset)
        //   ],
        // )
        );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime ?? DateTime.now()) >
            const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press again to exit');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
