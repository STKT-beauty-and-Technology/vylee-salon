import 'package:flutter/material.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/features/addlisting/view/helpers/female_service_category_card.dart';
import 'package:vylee_partner/themes/app_colors.dart';


class FemaleServiceCategory extends StatefulWidget {
  const FemaleServiceCategory({super.key, required this.gender});
  final String gender;

  @override
  State<FemaleServiceCategory> createState() => _FemaleServiceCategoryState();
}

class _FemaleServiceCategoryState extends State<FemaleServiceCategory> {
  final types = [
    "Hair Cut",
    "Hair Style",
    "Hair Chemical",
    "Nail Art",
    "Skin Care",
    "Hair Color",
    "Manicure Pedicure",
    "Makeup",
    "Pre Bridal",
    "Spa & Massage"
  ];

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
                  ),
                ),
                Text(
                  widget.gender.toUpperCase(),
                  style: const TextStyle(
                      color: AppColors.appViolet,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ],
            ),
            GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: types.length,
                itemBuilder: (context, int) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FemaleServiceCategoryCard(type: types[int]),
                  );
                }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
