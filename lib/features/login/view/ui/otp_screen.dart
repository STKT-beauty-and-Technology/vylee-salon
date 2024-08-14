import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/themes/app_colors.dart';

import '../../../../core/path/image_path.dart';
import '../../../../navigation/page_routes.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.mobileNumber});
  final String mobileNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: AppColors.appViolet,
          child: Stack(
            children: [
              Positioned(
                left: SizeConfig.widthMultiplier! * 10,
                top: SizeConfig.screenHeight! * 0.3,
                child: Image.asset(
                  ImagePath.loginBackground,
                  width: SizeConfig.screenWidth! * 0.95,
                  height: SizeConfig.screenHeight! * 0.68,
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: SizedBox(
                  //A non-constrained impose over its child to gain control of its natural size.
                  child: UnconstrainedBox(
                    child: SizedBox(
                      width: SizeConfig.screenWidth! * 0.85,
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
                          SvgPicture.asset(ImagePath.avatarIcon),
                          const SizedBox(height: 10),
                          Text(
                            "OTP VERIFICATION",
                            style: GoogleFonts.frankRuhlLibre(
                                textStyle:
                                    const TextStyle(color: AppColors.white),
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Enter the OTP sent to +91-${widget.mobileNumber}",
                            style: GoogleFonts.frankRuhlLibre(
                                textStyle:
                                    const TextStyle(color: AppColors.white),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          OtpTextField(
                            numberOfFields: 4,
                            margin: const EdgeInsets.all(15),
                            // contentPadding: const EdgeInsets.all(20),
                            fieldWidth: SizeConfig.screenWidth! * 0.13,
                            enabled: true,
                            filled: true,
                            decoration: const InputDecoration(
                                fillColor: AppColors.white, filled: true),
                            showFieldAsBox: true,
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            onSubmit: (String verificationCode) {},
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Center(
                              child: SizedBox(
                                width: SizeConfig.screenWidth! * 0.5,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      PageRoutes.registrationScreen,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.appViolet,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          side: const BorderSide(
                                              color: AppColors.white)),
                                      elevation: 0),
                                  child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 10.0),
                                      child: Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 24,
                                        ),
                                      )),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
