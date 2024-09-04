import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/common widgets/custom_appbar.dart';
import '../../../core/load_image/image_loader.dart';
import '../../../core/path/image_path.dart';
import '../../../themes/app_colors.dart';
import '../../../utilities/string.dart';

class AboutVylee extends StatefulWidget {
  const AboutVylee({super.key});

  @override
  State<AboutVylee> createState() => _AboutVyleeState();
}

class _AboutVyleeState extends State<AboutVylee> {
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
        child: Column(
          children: [
            const SizedBox(
              height: 5,
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
                Text(
                  Constant.aboutVylee,
                  style: const TextStyle(
                      color: AppColors.appViolet,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppColors.appViolet),
              margin: EdgeInsets.symmetric(horizontal: 25),
              height: 200,
              width: 450,
              child:
              Center(
                child: ImageLoader.asset(
                  ImagePath.vyleeTextLogo,
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(Constant.aboutUs1,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 15),
                  Text(Constant.aboutUs2,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 15),
                  Text(Constant.aboutUs3,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 15),
                  Text(Constant.aboutUs4,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500)),
                  const SizedBox(height: 15),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
