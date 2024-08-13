import 'package:flutter/cupertino.dart';
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
                        SvgPicture.asset(ImagePath.avatarIcon),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Mobile Number",
                            style: GoogleFonts.frankRuhlLibre(
                              textStyle:
                                  const TextStyle(color: AppColors.white),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: SizeConfig.heightMultiplier! * 40,
                          child: TextField(
                            maxLines: 5,
                            controller: phoneController,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            decoration: const InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                fillColor: AppColors.textFieldColor),
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: termsAccepted,
                                activeColor: AppColors.white,
                                tristate: false,
                                fillColor: const WidgetStatePropertyAll(
                                    AppColors.white),
                                checkColor: AppColors.black,
                                onChanged: (value) {
                                  setState(() {
                                    print(value);
                                    termsAccepted = value ?? false;
                                  });
                                }),
                            Text(
                              Constant.byClickingAccept,
                              style: const TextStyle(
                                  color: AppColors.white, fontSize: 10),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Center(
                            child: SizedBox(
                              width: SizeConfig.screenWidth! * 0.6,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context,
                                    PageRoutes.otpScreen,
                                      arguments: {
                                        "mobileNumber": phoneController.text
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 0),
                                child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 10.0),
                                    child: Text(
                                      "CONTINUE",
                                      style: TextStyle(color: AppColors.black),
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
            ],
          ),
        ),
      ),
    );
  }
}
