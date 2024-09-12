import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/data/local/vendorId_provider.dart';
import 'package:vylee_partner/features/splash/view/ui/splash_screen.dart';
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
  final picker = ImagePicker();
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
              padding: const EdgeInsets.all(30),
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      "SALON NAME",
                      style: GoogleFonts.frankRuhlLibre(
                        textStyle: const TextStyle(fontSize: 15),
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
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
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context)
                                    .pushNamed(PageRoutes.uploadDocuments);
                              }
                            },
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
                                  Row(
                                    children: [
                                      Text("Business Verification",
                                          style: GoogleFonts.inter(
                                              color: AppColors.appViolet,
                                              fontWeight: FontWeight.w500,
                                              textStyle: const TextStyle(
                                                  fontSize: 15))),
                                      Text("*",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              color: AppColors.red,
                                              fontWeight: FontWeight.w500,
                                              textStyle: const TextStyle(
                                                  fontSize: 15))),
                                    ],
                                  ),
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context)
                                    .pushNamed(PageRoutes.bankAccounts);
                              }
                            },
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
                                  Row(
                                    children: [
                                      Text("Bank Details",
                                          style: GoogleFonts.inter(
                                              color: AppColors.appViolet,
                                              fontWeight: FontWeight.w500,
                                              textStyle: const TextStyle(
                                                  fontSize: 15))),
                                      Text("*",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.inter(
                                              color: AppColors.red,
                                              fontWeight: FontWeight.w500,
                                              textStyle: const TextStyle(
                                                  fontSize: 15))),
                                    ],
                                  ),
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context)
                                    .pushNamed(PageRoutes.transactions);
                              }
                            },
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
                                Row(
                                  children: [
                                    Text("Payment History",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: AppColors.appViolet,
                                            fontWeight: FontWeight.w500,
                                            textStyle:
                                                const TextStyle(fontSize: 15))),
                                    Text("*",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.inter(
                                            color: AppColors.red,
                                            fontWeight: FontWeight.w500,
                                            textStyle:
                                                const TextStyle(fontSize: 15))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context).pushNamed(
                                    PageRoutes.galleryPage,
                                    arguments: {"edit": true});
                              }
                            },
                            frontIconSpacing: 20,
                            trailingIconSpacing: 70,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: const Icon(
                              Icons.image,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Edit shop photo and video",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                            const TextStyle(fontSize: 15))),
                                Text("*",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.red,
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context).pushNamed(
                                    PageRoutes.salonInformation,
                                    arguments: {"edit": true});
                              }
                            },
                            frontIconSpacing: 20,
                            trailingIconSpacing: 70,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: const Icon(
                              Icons.info_outline,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Salon Details",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                            const TextStyle(fontSize: 15))),
                                Text("*",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.red,
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context).pushNamed(
                                    PageRoutes.workingHours,
                                    arguments: {"edit": true});
                              }
                            },
                            frontIconSpacing: 20,
                            trailingIconSpacing: 70,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: const Icon(
                              Icons.watch_later_outlined,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Working Hours",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                            const TextStyle(fontSize: 15))),
                                Text("*",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.red,
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context).pushNamed(
                                    PageRoutes.addAddress,
                                    arguments: {"edit": true});
                              }
                            },
                            frontIconSpacing: 20,
                            trailingIconSpacing: 70,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: const Icon(
                              Icons.pin_drop_outlined,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Saloon Address",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w500,
                                        textStyle:
                                            const TextStyle(fontSize: 15))),
                                Text("*",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.inter(
                                        color: AppColors.red,
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context)
                                    .pushNamed(PageRoutes.termsConditions);
                              }
                            },
                            frontIconSpacing: 20,
                            trailingIconSpacing: 35,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: Image.asset(
                              ImagePath.termsAndConditions,
                              width: 30,
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context)
                                    .pushNamed(PageRoutes.helpAndSupport);
                              }
                            },
                            frontIconSpacing: 20,
                            trailingIconSpacing: 70,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: const Icon(
                              Icons.headset_mic_outlined,
                              size: 30,
                              color: AppColors.black,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Help & Support",
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {},
                            frontIconSpacing: 20,
                            trailingIconSpacing: 120,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: Image.asset(
                              ImagePath.rateUsStarIcon,
                              width: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Rate Us",
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
                  const SizedBox(height: 15),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: 70,
                          child: CustomButton(
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context)
                                    .pushNamed(PageRoutes.aboutUs);
                              }
                            },
                            frontIconSpacing: 20,
                            trailingIconSpacing: 80,
                            bgcolor: const Color(0xffF6EAF9),
                            frontIcon: Image.asset(
                              ImagePath.aboutUsIcon,
                              width: 30,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("About VYLEE",
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
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      height: SizeConfig.screenHeight! * 0.055,
                      width: SizeConfig.screenWidth! * 0.42,
                      child: CustomButton(
                        text: "LOGOUT",
                        borderColor: AppColors.appBorderPurple,
                        textStyle: GoogleFonts.lateef(
                            fontWeight: FontWeight.w400, fontSize: 26),
                        onPressed: () async {
                          await VendorIdProvider.removeVendorId();
                          if (mounted) {
                            Navigator.of(context).pushAndRemoveUntil<void>(
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const SplashScreen()),
                              ModalRoute.withName(PageRoutes.splash),
                            );
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
            child: GestureDetector(
              onTap: () async {
                final xfile =
                    await picker.pickImage(source: ImageSource.gallery);
                if (xfile != null) {
                  setState(() {
                    image = File(xfile.path);
                  });
                }
              },
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 60,
                foregroundImage: image != null ? AssetImage(image!.path) : null,
                child: image != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            image!,
                          ),
                        ),
                      )
                    : Text(
                        "ADD LOGO",
                        style: GoogleFonts.frankRuhlLibre(
                          fontWeight: FontWeight.w400,
                          color: AppColors.appViolet,
                        ),
                      ),
              ),
            )),
      ],
    );
  }
}
