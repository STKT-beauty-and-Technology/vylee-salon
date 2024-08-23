import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../navigation/page_routes.dart';
import '../../../../themes/app_colors.dart';

class AllServices extends StatefulWidget {
  const AllServices({super.key});

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
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
                    "HAIR CUT & STYLE",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  SizedBox(width: 14),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(PageRoutes.femaleCustomService);
                          },
                          icon: const Icon(
                            Icons.add_circle_outline,
                            size: 25,
                            weight: 100,
                            color: AppColors.appViolet,
                          )),
                      const Text(
                        "CUSTOM SERVICE",
                        style: TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w200,
                            fontSize: 10),
                      ),
                    ],
                  )

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
