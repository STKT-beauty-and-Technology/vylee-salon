import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/common/common%20widgets/custom_form_field.dart';
import 'package:vylee_partner/features/salon_services/model/category_data_response.dart';
import 'package:vylee_partner/features/salon_services/model/update_price_request.dart';
import 'package:vylee_partner/features/salon_services/view/ui/service_categories/add_service.dart';
import 'package:vylee_partner/features/salon_services/view_model/cubits/service_category_cubit.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../navigation/page_routes.dart';
import '../../../../themes/app_colors.dart';

class SubCategoriesPage extends StatefulWidget {
  const SubCategoriesPage({super.key, required this.service});
  final ServiceProduct service;

  @override
  State<SubCategoriesPage> createState() => _SubCategoriesPageState();
}

class _SubCategoriesPageState extends State<SubCategoriesPage> {
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
          // height: SizeConfig.screenHeight! * 0.9,
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                      Text(
                        widget.service.serviceName?.toUpperCase() ?? "",
                        style: const TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                      const SizedBox(width: 14),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddService(
                                  service: widget.service,
                                  categoryId: widget
                                      .service.serviceCategory?.categoryId)));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: 25,
                                weight: 100,
                                color: AppColors.appViolet,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "ADD SERVICE",
                                style: TextStyle(
                                    color: AppColors.appViolet,
                                    fontWeight: FontWeight.w200,
                                    fontSize: 10),
                              ),
                              SizedBox(width: 14),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.9,
                child: Column(
                  children: List.generate(
                      widget.service.subCategories?.length ?? 0,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.service.subCategories![index]
                                          .subCategoryName ??
                                      "",
                                  style: TextStyle(fontSize: 20),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await showSetPriceDialog(
                                        widget.service.subCategories![index],
                                        widget.service.serviceId!);
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: AppColors.appViolet,
                                                width: 1)),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 2, 10, 2),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Set Price"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      PopupMenuButton<int>(
                                        onSelected: (value) {
                                          // if (value == 1) {
                                          //   () async {
                                          //     await context
                                          //         .read<DeleteBankCubit>()
                                          //         .removeBank(
                                          //       DeleteBankRequest(
                                          //           bankAccountId:
                                          //           bankdetaill.id ?? 0),
                                          //     );
                                          //     showToast(
                                          //         "Bank Account Deleted Successfully");
                                          //   };
                                          // }
                                        },
                                        icon: const Icon(Icons.more_vert),
                                        itemBuilder: (context) => [
                                          const PopupMenuItem<int>(
                                              value: 1,
                                              child: Text("Update Price")),
                                          const PopupMenuItem<int>(
                                              value: 1,
                                              child: Text("Delete Service")),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  height: SizeConfig.screenHeight! * 0.055,
                  width: SizeConfig.screenWidth! * 0.42,
                  child: CustomButton(
                    text: "SAVE",
                    borderColor: AppColors.appBorderPurple,
                    textStyle: GoogleFonts.lateef(
                        fontWeight: FontWeight.w400, fontSize: 26),
                    onPressed: () {
                      if (mounted) {
                        Navigator.of(context).popUntil(
                            ModalRoute.withName(PageRoutes.homeScreen));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSetPriceDialog(SubCategory subCategory, int serviceId) async {
    final priceController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              width: SizeConfig.screenWidth! * 0.6,
              height: SizeConfig.screenHeight! * 0.22,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "change ${subCategory.subCategoryName} price",
                      style: const TextStyle(
                          color: AppColors.appViolet,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    CustomFormField(
                      isEnabled: true,
                      height: 50,
                      isRequired: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      width: SizeConfig.screenWidth! * 0.4,
                      controller: priceController,
                      text: "enter price",
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      text: "Save Price",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await context
                              .read<ServiceCategoryCubit>()
                              .updatePrice(UpdatePriceRequest(
                                  subCategoryName:
                                      subCategory.subCategoryName ?? "",
                                  serviceId: serviceId,
                                  subCategoryId: subCategory.subCategoryId,
                                  price:
                                      int.tryParse(priceController.text) ?? 0));
                          // ignore: use_build_context_synchronously
                          if (mounted) Navigator.of(context).pop();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
