import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/salon_services/model/category_data_response.dart';
import 'package:vylee_partner/features/salon_services/view/ui/service_categories/services_page.dart';
import 'package:vylee_partner/themes/app_colors.dart';

import '../../view_model/cubits/delete_category_cubit.dart';

class ServiceCategoryCard extends StatelessWidget {
  const ServiceCategoryCard(
      {Key? key,
      required this.categoryName,
      required this.categoryId,
      required this.services})
      : super(key: key);

  final String categoryName;
  final int categoryId;
  final List<ServiceProduct> services;

  @override
  Widget build(BuildContext context) {
    final List staticCategories = ["female", "male"];
    return BlocProvider(
      create: (context) => DeleteCategoryCubit(),
      child: GestureDetector(
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
          width: SizeConfig.screenWidth! * 0.9,
          height: SizeConfig.screenHeight! * 0.14,
          padding: const EdgeInsets.only(right: 10),
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
              // BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
              //   listener: (context, state) {
              //     if (state is DeleteCategoryFailureState) {
              //       // showToast((state).error);
              //       showToast("Category Deleted");
              //     } else if (state is DeleteCategorySuccessState) {
              //       showToast("Category Deleted Successfully");
              //     }
              //   },
              //   builder: (BuildContext context, state) {
              //     if (state is DeleteCategoryLoadingState) {
              //       return const CircularProgressIndicator();
              //     }
              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Align(
              //         alignment: Alignment.topRight,
              //         child: PopupMenuButton<int>(
              //           onSelected: (value) async {
              //             if (value == 1) {
              //               await context
              //                   .read<DeleteCategoryCubit>()
              //                   .removeCategory(
              //                     DeleteCategoryRequest(
              //                       categoryId: categoryId,
              //                     ),
              //                   );
              //             }
              //           },
              //           icon: const Icon(Icons.more_vert),
              //           itemBuilder: (context) => [
              //             const PopupMenuItem<int>(
              //                 value: 1, child: Text("Delete Category"))
              //           ],
              //         ),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
// onTap: () async {
// await context.read<DeleteCategoryCubit>().removeCategory(
// DeleteCategoryRequest(
// categoryId: categoryId,
// ),
// );
// },
