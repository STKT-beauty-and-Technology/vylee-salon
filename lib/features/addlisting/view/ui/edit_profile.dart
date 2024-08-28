import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<String> options = [
    "Your Address",
    "Salon Information",
    "Working Hours",
    "Gallery",
    "Service Categories",
    "Available Slots"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leadingWidget: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: ImageLoader.asset(
            ImagePath.vyleeTextLogo,
            height: 10,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        height: 100,
        backgroundColor: AppColors.appViolet,
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! * 0.9,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 25,
                        weight: 100,
                        color: AppColors.appViolet,
                      )),
                  const Text(
                    "EDIT PROFILE",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              ...List.generate(options.length, (index) {
                return Container(
                  width: SizeConfig.screenWidth! * 0.8,
                  height: 60,
                  margin: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      String pageNavigated = "";
                      switch (index) {
                        case 0:
                          pageNavigated = PageRoutes.addAddress;
                          break;
                        case 1:
                          pageNavigated = PageRoutes.salonInformation;
                          break;
                        case 2:
                          pageNavigated = PageRoutes.workingHours;
                          break;
                        case 3:
                          pageNavigated = PageRoutes.galleryPage;
                          break;
                        case 4:
                          pageNavigated = PageRoutes.serviceCategories;
                          break;
                        case 5:
                          pageNavigated = PageRoutes.availableSlots;
                          break;
                      }
                      if (mounted) {
                        Navigator.of(context).pushNamed(pageNavigated,
                            arguments: {"edit": true});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.appGray),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                                "${ImagePath.editProfile}${options[index].toLowerCase()}.png",
                                width: 30,
                                height: 30),
                            const SizedBox(width: 30),
                            Text(
                              options[index],
                              style: const TextStyle(
                                  color: AppColors.appViolet,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        const Icon(Icons.arrow_forward_ios_sharp)
                      ],
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
