import 'package:flutter/material.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/salon_services/model/category_data_response.dart';
import 'package:vylee_partner/features/salon_services/view/ui/service_categories/services_page.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class ServiceCategoryCard extends StatelessWidget {
  const ServiceCategoryCard(
      {super.key,
      required this.categoryName,
      required this.categoryId,
      required this.services});
  final String categoryName;
  final int categoryId;
  final List<ServiceProduct> services;

  @override
  Widget build(BuildContext context) {
    final List staticCategories = ["female", "male"];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ServicesPage(
                categoryId: categoryId,
                categoryName: categoryName,
                services: services)));
        // switch (category.toLowerCase()) {
        //   case "female":
        //    Navigato
        //     break;
        //   case "male":
        //     Navigator.of(context).pushNamed(PageRoutes.maleCategory,
        //         arguments: {"gender": category});
        //     break;
        //   case "others":
        //     Navigator.of(context).pushNamed(PageRoutes.othersCategory,
        //         arguments: {"gender": category});
        //     break;
        //   default:
        // }
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
                backgroundImage: AssetImage(staticCategories
                        .contains(categoryName.trim().toLowerCase())
                    ? "${ImagePath.serviceCategory}service_category_${categoryName[0].toLowerCase()}.png"
                    : "${ImagePath.serviceCategory}service_category_o.png"),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(categoryName.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 24, color: AppColors.appViolet)),
                Text(
                  "${services.length} Services",
                  style: const TextStyle(color: AppColors.black),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
