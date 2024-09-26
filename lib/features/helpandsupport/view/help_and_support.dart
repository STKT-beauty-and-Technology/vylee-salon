import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../common/common widgets/custom_appbar.dart';
import '../../../core/load_image/image_loader.dart';
import '../../../core/path/image_path.dart';
import '../../../themes/app_colors.dart';
import '../../../utilities/string.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
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
                    onPressed: () =>
                        AudioPlayer().play(AssetSource(ImagePath.mySound)),
                    // onPressed: () {
                    //   Navigator.of(context).pop();
                    // },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 25,
                      weight: 100,
                      color: AppColors.appViolet,
                    )),
                Text(
                  Constant.helpSupport,
                  style: const TextStyle(
                      color: AppColors.appViolet,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      Constant.reachUs,
                      style: const TextStyle(
                          color: AppColors.appViolet,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ImageLoader.assetSvg(ImagePath.atSymbol),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'support@vyleesalon.in',
                            );
                            launchUrl(emailLaunchUri);
                          },
                          child: Text(
                            Constant.supportEmail,
                            style: const TextStyle(
                                color: AppColors.appViolet,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ImageLoader.assetSvg(ImagePath.callSymbol),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          Constant.supportNumber,
                          style: const TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
