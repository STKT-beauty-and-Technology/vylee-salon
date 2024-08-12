import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/themes/app_colors.dart';

import '../../../../components/icon_component.dart';
import '../../../../core/path/image_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.themeColorPink,
        leading: IconButton(
          icon: svgIconComponent(iconData: ImagePath.backwardIcon),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.themeColorPink,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
             const Center(
              child: SizedBox(
               width: 300 ,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: AppColors.white),
                    fillColor: AppColors.green20,
                    border: OutlineInputBorder(),
                    labelText: 'Mobile Number'
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
