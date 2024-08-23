import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.circle_notifications_outlined,
            fill: 0.1,
            weight: 0.1,
            size: 40,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.black,
        selectedItemColor: AppColors.black,
        backgroundColor: Colors.grey.shade300,
        onTap: (value) {
          switch (value) {
            case 0:
              //navigate to bookings
              break;
            case 1:
              //navigate to add listings
              Navigator.of(context).pushNamed(PageRoutes.addAddress);
              break;
            case 2:
              //navigate to profile
              Navigator.of(context).pushNamed(PageRoutes.accountInformation);
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  ImagePath.bookingsIcon,
                  width: 30,
                  height: 30,
                ),
              ),
              label: "Bookings"),
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  ImagePath.addListingIcon,
                  width: 30,
                  height: 30,
                ),
              ),
              label: "Add Listings"),
          BottomNavigationBarItem(
              icon: Container(
                width: 50,
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset(
                  ImagePath.profileIcon,
                  width: 30,
                  height: 30,
                ),
              ),
              label: "Profile"),
        ],
      ),
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              const Text(
                "WELCOME",
                style: TextStyle(
                  color: AppColors.appViolet,
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                ),
              ),
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
                    name.toUpperCase(),
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
                            AppColors.appViolet, BlendMode.screen))),
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
              const Spacer(flex: 1),

            ],
          ),
        ),
      ),
    );
  }
}
