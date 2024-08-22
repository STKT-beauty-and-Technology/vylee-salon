import 'package:flutter/material.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class FemaleServiceCategoryCard extends StatelessWidget {
  const FemaleServiceCategoryCard({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (type.toLowerCase()) {}
      },
      child: Container(
        width: SizeConfig.screenWidth! * 0.42,
        height: SizeConfig.screenHeight! * 0.2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.appGray,
            // gradient: const LinearGradient(
            //   colors: [
            //     Color(0xFFF5EDF6),
            //     Color(0xFFF6EAF9),
            //     // Color(0xFFF6EAF9),
            //     // Color(0xFFFFFFFF),
            //   ],
            //   begin: Alignment.topCenter,
            // ),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(color: AppColors.appViolet, width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageLoader.asset(
                    "${ImagePath.femaleServiceCategory + getImageNameFromType(type.toLowerCase())}.jpeg",
                    fit: BoxFit.fill,
                    height: SizeConfig.screenHeight! * 0.12,
                    width: SizeConfig.screenWidth! * 0.35),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: SizeConfig.screenWidth! * 0.35,
              height: 30,
              child: CustomButton(
                bgcolor: AppColors.white,
                fgcolor: AppColors.black,
                elevation: 2,
                borderRadius: 20,
                onPressed: () {
                  if (context.mounted) {
                    Navigator.of(context)
                        .pushNamed(PageRoutes.femaleCustomService);
                  }
                },
                text: type,
                textStyle: const TextStyle(fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getImageNameFromType(String type) {
    String imageName = type;
    final words = type.split(" ").toList();
    if (words.length > 1) {
      imageName = words.join("_");
    }
    return imageName;
  }
}
