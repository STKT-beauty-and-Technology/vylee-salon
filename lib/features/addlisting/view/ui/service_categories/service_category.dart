import 'package:flutter/material.dart';
import 'package:vylee_partner/features/addlisting/view/helpers/service_category_card.dart';

import '../../../../../common/common widgets/custom_appbar.dart';
import '../../../../../core/load_image/image_loader.dart';
import '../../../../../core/path/image_path.dart';
import '../../../../../core/responsive/size_config.dart';
import '../../../../../themes/app_colors.dart';

class ServiceCategory extends StatefulWidget {
  const ServiceCategory({super.key, this.isEdit});
  final bool? isEdit;


  @override
  State<ServiceCategory> createState() => _ServiceCategoryState();
}

class _ServiceCategoryState extends State<ServiceCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGray,
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
        height: 80,
        backgroundColor: AppColors.appViolet,
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xFFF5EDF6),
            Color(0xFFF6EAF9),
            Color(0xFFF6EAF9),
            Color(0xFFFFFFFF),
          ])),
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight! * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    "SERVICE CATEGORIES",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const ServiceCategoryCard(
                category: "female",
              ),
              const SizedBox(height: 30),
              const ServiceCategoryCard(
                category: "male",
              ),
              const SizedBox(height: 30),
              const ServiceCategoryCard(
                category: "others",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
