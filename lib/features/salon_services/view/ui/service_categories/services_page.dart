import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/features/salon_services/model/category_data_response.dart';
import 'package:vylee_partner/features/salon_services/view/helpers/service_card.dart';
import 'package:vylee_partner/features/salon_services/view/ui/service_categories/add_service.dart';
import 'package:vylee_partner/themes/app_colors.dart';

import '../../../../../common/utitlties/common_utilities.dart';
import '../../../model/delete_category_request.dart';
import '../../../view_model/cubits/delete_category_cubit.dart';
import '../../../view_model/cubits/delete_category_state.dart';

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
  // @override
  // void initState() {
  //   context
  //       .read<DeleteCategoryCubit>()
  //       .removeCategory(DeleteCategoryRequest(categoryId: widget.categoryId));
  //   super.initState();
  // }

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
                const Spacer(),
                BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
                  listener: (context, state) {
                    if (state is DeleteCategoryFailureState) {
                      // showToast((state).error);
                      showToast("Category Deleted");
                      Navigator.of(context).pop();
                    } else if (state is DeleteCategorySuccessState) {
                      showToast("Category Deleted Successfully");
                    }
                  },
                  builder: (BuildContext context, state) {
                    if (state is DeleteCategoryLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton<int>(
                          onSelected: (value) async {
                            if (value == 1) {
                              await context
                                  .read<DeleteCategoryCubit>()
                                  .removeCategory(
                                    DeleteCategoryRequest(
                                      categoryId: widget.categoryId,
                                    ),
                                  );
                            }
                          },
                          icon: const Icon(Icons.more_vert),
                          itemBuilder: (context) => [
                            const PopupMenuItem<int>(
                                value: 1, child: Text("Delete Category"))
                          ],
                        ),
                      ),
                    );
                  },
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
