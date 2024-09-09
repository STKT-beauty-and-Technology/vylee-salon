import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/themes/app_colors.dart';
import 'package:vylee_partner/utilities/string.dart';

import '../../../../core/path/image_path.dart';
import '../../../../navigation/page_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool termsAccepted = false;
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: AppColors.appPurple,
          child: Stack(
            children: [
              Positioned(
                left: SizeConfig.widthMultiplier! * 10,
                top: SizeConfig.screenHeight! * 0.25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    ImagePath.loginBackground,
                    width: SizeConfig.screenWidth! * 0.95,
                    height: SizeConfig.screenHeight! * 0.72,
                    fit: BoxFit.fill,
                    colorBlendMode: BlendMode.color,
                    color: AppColors.appViolet,
                  ),
                ),
              ),
              Container(
                color: AppColors.appGray.withOpacity(0.6),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                
              ),
              Center(
                child: UnconstrainedBox(
                  child: SizedBox(
                    width: SizeConfig.widthMultiplier! * 300,
                    height: SizeConfig.screenHeight,
                    child: Column(
                      children: [
                        Center(
                          child: ImageLoader.asset(
                            ImagePath.vyleeTextLogo,
                            height: 200,
                            width: 250,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 45),
                        SvgPicture.asset(ImagePath.avatarIcon),
                        const SizedBox(
                          height: 50,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: SizeConfig.screenWidth! * 0.7,
                              height: 55,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.only(left: 60, bottom: 8),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    color: AppColors.gray600, width: 3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: Constant.enterUsername,
                                    fillColor: AppColors.white,
                                    hintStyle: GoogleFonts.inter(
                                        color: AppColors.black, fontSize: 15),
                                    border: InputBorder.none),
                              ),
                            ),
                            Container(
                              width: SizeConfig.screenWidth! * 0.7,
                              height: 55,
                              alignment: Alignment.center,
                              padding:
                              const EdgeInsets.only(left: 60, bottom: 8),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    color: AppColors.gray600, width: 3),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: TextFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: Constant.enterUsername,
                                    fillColor: AppColors.white,
                                    hintStyle: GoogleFonts.inter(
                                        color: AppColors.black, fontSize: 15),
                                    border: InputBorder.none),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Center(
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      color: AppColors.gray600, width: 5)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 4, right: 4, top: 3, bottom: 3),
                                child: SizedBox(
                                  width: SizeConfig.screenWidth! * 0.7,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, PageRoutes.bookingDetails,
                                          arguments: {
                                            Constant.mobileNumber:
                                                phoneController.text
                                          });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        elevation: 0),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 10.0),
                                        child: Text(
                                          Constant.login,
                                          style: GoogleFonts.inter(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          ),
                                        )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Constant.dontHaveAccount,
                              style: GoogleFonts.inter(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PageRoutes.registrationScreen,
                                    arguments: {
                                      Constant.mobileNumber:
                                      phoneController.text
                                    });
                              },
                              child: Text(
                                Constant.signUp,
                                style: GoogleFonts.inter(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 80),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              Constant.byContinuing,
                              style: GoogleFonts.inter(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              Constant.termsPrivacy,
                              style: GoogleFonts.inter(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
