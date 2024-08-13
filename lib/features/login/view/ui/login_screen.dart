import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.appViolet,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: ImageLoader.asset(
                ImagePath.vyleeTextLogo,
                height: 200,
                width: 250,
                fit: BoxFit.contain,
              ),
            ),
            Stack(
              children: [
                Image.asset(ImagePath.loginBackground),
                Center(
                  child: Column(
                    children: [
                      Positioned(child: SvgPicture.asset(ImagePath.avatarIcon)),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, right: 130),
                        child: Text(
                          "Mobile Number",
                          style:
                              TextStyle(color: AppColors.white, fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 10, right: 55, left: 55),
                          child: TextField(
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.textFieldColor),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,left: 20),
                        child: Row(
                          children: [
                            Text(
                              Constant.byClickingAccept,
                              style:
                                  const TextStyle(color: AppColors.white, fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                PageRoutes.login,
                              );
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
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
