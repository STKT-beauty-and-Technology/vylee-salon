import 'package:flutter/material.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class ServiceCategoryCard extends StatelessWidget {
  const ServiceCategoryCard({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (category.toLowerCase()) {
          case "female":
            Navigator.of(context).pushNamed(PageRoutes.femaleCategory);
            break;
          case "male":
            Navigator.of(context).pushNamed(PageRoutes.maleCategory);
            break;
          case "others":
            Navigator.of(context).pushNamed(PageRoutes.othersCategory);
            break;
          default:
        }
      },
      child: Container(
        width: SizeConfig.screenWidth! * 0.8,
        height: SizeConfig.screenHeight! * 0.14,
        padding: const EdgeInsets.only(right: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: AppColors.appViolet, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 46,
              backgroundColor: AppColors.black,
              child: CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 44,
                backgroundImage: AssetImage(
                    "${ImagePath.serviceCategory}service_category_${category[0].toLowerCase()}.png"),
              ),
            ),
            Text(category.toUpperCase(),
                style:
                    const TextStyle(fontSize: 24, color: AppColors.appViolet)),
          ],
        ),
      ),
    );
  }
}
