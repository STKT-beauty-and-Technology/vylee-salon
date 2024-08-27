import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  File? image;
  bool imagePicked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
            child: Container(
              padding: const EdgeInsets.all(50),
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "SALON NAME",
                    style: GoogleFonts.frankRuhlLibre(
                      textStyle: const TextStyle(fontSize: 15),
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "ACCOUNT INFORMATION",
                        style: TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {},
                            frontIconSpacing: 10,
                            trailingIconSpacing: 20,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: Image.asset(
                              ImagePath.businessVerification,
                              width: 30,
                              height: 30,
                            ),
                            backIcon: const Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Business Verification",
                                      style: GoogleFonts.inter(
                                          color: AppColors.appViolet,
                                          fontWeight: FontWeight.w500,
                                          textStyle:
                                              const TextStyle(fontSize: 15))),
                                  Text("Complete your kYC to start earn money.",
                                      style: GoogleFonts.inter(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                          textStyle:
                                              const TextStyle(fontSize: 8)))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {},
                            frontIconSpacing: 10,
                            trailingIconSpacing: 20,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: Image.asset(
                              ImagePath.bankDetailsIcon,
                              width: 30,
                              height: 30,
                            ),
                            backIcon: const Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Bank Details",
                                      style: GoogleFonts.inter(
                                          color: AppColors.appViolet,
                                          fontWeight: FontWeight.w500,
                                          textStyle:
                                              const TextStyle(fontSize: 15))),
                                  Text(
                                      "this account  is used to Facilitate all your",
                                      style: GoogleFonts.inter(
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w500,
                                          textStyle:
                                              const TextStyle(fontSize: 8)))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {},
                            frontIconSpacing: 20,
                            trailingIconSpacing: 60,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: Container(
                              width: 35,
                              height: 35,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: AppColors.black,
                                  )),
                              child: const Text(
                                "₹",
                                style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            backIcon: const Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Payment History",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                            const TextStyle(fontSize: 15))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {},
                            frontIconSpacing: 20,
                            trailingIconSpacing: 95,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: const CircleAvatar(
                              backgroundColor: AppColors.white,
                              child: Icon(Icons.person),
                            ),
                            backIcon: const Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Edit Profile",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                            const TextStyle(fontSize: 15))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {},
                            frontIconSpacing: 20,
                            trailingIconSpacing: 25,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: Image.asset(
                              ImagePath.termsAndConditions,
                              width: 30,
                            ),
                            backIcon: const Icon(
                              Icons.arrow_right,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Terms and Conditions",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                            const TextStyle(fontSize: 15))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Center(
                    child: SizedBox(
                      height: SizeConfig.screenHeight! * 0.055,
                      width: SizeConfig.screenWidth! * 0.42,
                      child: CustomButton(
                        text: "LOGOUT",
                        borderColor: AppColors.appBorderPurple,
                        textStyle: GoogleFonts.lateef(
                            fontWeight: FontWeight.w400, fontSize: 26),
                        onPressed: () {
                          if (mounted) {
                            Navigator.of(context).pushNamed(PageRoutes.splash);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: SizeConfig.screenHeight! * 0.08,
            left: SizeConfig.screenWidth! * 0.36,
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 60,
              child: Text(
                "ADD LOGO",
                style: GoogleFonts.frankRuhlLibre(
                  fontWeight: FontWeight.w400,
                  color: AppColors.appViolet,
                ),
              ),
            )),
      ],
    );
  }
}