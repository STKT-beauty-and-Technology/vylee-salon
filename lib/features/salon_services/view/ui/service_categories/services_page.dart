import 'package:flutter/material.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/features/salon_services/model/category_data_response.dart';
import 'package:vylee_partner/features/salon_services/view/helpers/service_card.dart';
import 'package:vylee_partner/features/salon_services/view/ui/service_categories/add_service.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage(
      {super.key,
      required this.categoryId,
      required this.categoryName,
      required this.services});
  final List<ServiceProduct> services;
  final int categoryId;
  final String categoryName;

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  // final types = [
  //   "Hair Cut",
  //   "Hair Style",
  //   "Hair Chemical",
  //   "Nail Art",
  //   "Skin Care",
  //   "Hair Color",
  //   "Manicure Pedicure",
  //   "Makeup",
  //   "Pre Bridal",
  //   "Spa & Massage"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddService(
                    categoryName: widget.categoryName,
                    categoryId: widget.categoryId,
                  )));
        },
        child: const Icon(Icons.add),
      ),
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
                  widget.categoryName.toUpperCase(),
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
                itemCount: widget.services.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ServiceCard(service: widget.services[index]),
                  );
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
