import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/features/salon_services/model/add_category_request.dart';
import 'package:vylee_partner/features/salon_services/view/helpers/service_category_card.dart';
import 'package:vylee_partner/features/salon_services/view_model/cubits/service_category_cubit.dart';
import 'package:vylee_partner/features/salon_services/view_model/cubits/service_category_state.dart';

import '../../../../../common/common widgets/custom_appbar.dart';
import '../../../../../common/common widgets/custom_dropdown.dart';
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
  void initState() {
    context.read<ServiceCategoryCubit>().getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appGray,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showAddCategoryDialog();
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
            // height: SizeConfig.screenHeight! * 0.9,
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
                BlocConsumer<ServiceCategoryCubit, ServiceCategoryState>(
                  listener: (context, state) {
                    if (state is ServiceCategoryFailureState) {
                      showToast("Failed to fetch categories");
                    }
                  },
                  builder: (context, state) {
                    if (state is ServiceCategoryLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ServiceCategorySuccessState) {
                      return state.categories.isEmpty
                          ? const Center(
                              child: Text(
                                  "No Categories Found. Please Add Category"),
                            )
                          : Column(
                              children: List.generate(state.categories.length,
                                  (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  child: ServiceCategoryCard(
                                    categoryId:
                                        state.categories[index].categoryId ?? 0,
                                    categoryName:
                                        state.categories[index].categoryName ??
                                            "category",
                                    services: state.categories[index]
                                            .categoryData?.serviceProducts ??
                                        [],
                                  ),
                                );
                              }),
                            );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            )),
      ),
    );
  }

  showAddCategoryDialog() async {
    final categoryController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              width: SizeConfig.screenWidth! * 0.8,
              height: SizeConfig.screenHeight! * 0.2,
              child: Column(
                children: [
                  CustomDropdown(
                    height: 50,
                    width: SizeConfig.screenWidth! * 0.5,
                    controller: categoryController,
                    hintText: "Select Category",
                    itemList: const ['Male', 'Female', 'Others'],
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: "Add Category",
                    onPressed: () async {
                      await context.read<ServiceCategoryCubit>().addCategory(
                          AddCategoryRequest(
                              categoryName: categoryController.text));
                      // ignore: use_build_context_synchronously
                      if (mounted) Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
