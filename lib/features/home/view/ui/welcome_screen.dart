import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/themes/app_colors.dart';
import 'package:vylee_partner/utilities/string.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen(
      {super.key, required this.name, required this.addOnPressed});

  final String name;
  final Function addOnPressed;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  DateTime? currentBackPressTime;
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        // floatingActionButton: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.circle_notifications_outlined,
        //       fill: 0.1,
        //       weight: 0.01,
        //       color: Color.fromARGB(255, 144, 140, 140),
        //       size: 40,
        //     )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // const Spacer(flex: 2),
                // const Text(
                //   "WELCOME",
                //   style: TextStyle(
                //     color: AppColors.appViolet,
                //     fontSize: 40,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(top: 10),
                      width: 40,
                      child: const Divider(
                        color: AppColors.appViolet,
                        thickness: 2,
                      ),
                    ),
                    Text(
                      widget.name.toUpperCase(),
                      style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: AppColors.appViolet,
                          ),
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      margin: const EdgeInsets.only(left: 10),
                      width: 40,
                      child: const Divider(
                        color: AppColors.appViolet,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: SizeConfig.screenHeight! * 0.55,
                  width: SizeConfig.screenWidth! * 0.7,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          filterQuality: FilterQuality.none,
                          fit: BoxFit.cover,
                          image: AssetImage(ImagePath.welcomeBg),
                          colorFilter: ColorFilter.mode(
                              AppColors.appPurple2, BlendMode.screen))),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      CircleAvatar(
                        // foregroundImage: AssetImage(),
                        backgroundColor: AppColors.white,
                        radius: 110,
                        child: Image.asset(
                          ImagePath.listingAvatar,
                          fit: BoxFit.fill,
                          width: 180,
                        ),
                      ),
                      const Spacer(),
                      // SizedBox(
                      //   width: SizeConfig.screenWidth! * 0.42,
                      //   child: CustomButton(
                      //     text: "ADD LISTINGS",
                      //     textStyle: GoogleFonts.jomolhari(
                      //         color: AppColors.black,
                      //         fontSize: 11,
                      //         fontWeight: FontWeight.w400),
                      //     bgcolor: AppColors.white,
                      //     onPressed: () {
                      //       if (context.mounted) {
                      //         Navigator.of(context)
                      //             .pushNamed(PageRoutes.addAddress);
                      //       }
                      //     },
                      //     fgcolor: AppColors.black,
                      //     trailingIconSpacing: 15,
                      //     elevation: 10,
                      //     backIcon: const Icon(
                      //       Icons.arrow_circle_right_outlined,
                      //       size: 20,
                      //     ),
                      //   ),
                      // ),
                      // const Spacer()
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(Constant.addDetails.toUpperCase(),
                    style: const TextStyle(
                        color: AppColors.appPurple2,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Text(Constant.getBookings.toUpperCase(),
                    style: const TextStyle(
                        color: AppColors.appPurple2,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                const Spacer(flex: 1),
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.45,
                  height: 55,
                  child: CustomButton(
                    bgcolor: AppColors.appPurple,
                    text: Constant.add.toUpperCase(),
                    borderRadius: 0,
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    onPressed: () {
                      widget.addOnPressed();
                    },
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime ?? DateTime.now()) >
            const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }
}
