import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/common/common%20widgets/custom_dropdown.dart';
import 'package:vylee_partner/common/common%20widgets/custom_form_field.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class FemaleCustomService extends StatefulWidget {
  const FemaleCustomService({super.key});

  @override
  State<FemaleCustomService> createState() => _FemaleCustomServiceState();
}

class _FemaleCustomServiceState extends State<FemaleCustomService> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController serviceNameController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minutesController = TextEditingController();
  final TextEditingController rpController = TextEditingController();
  final TextEditingController spController = TextEditingController();
  final TextEditingController maxServiceQuantController =
      TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? image;
  bool imagePicked = false;
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
          height: SizeConfig.screenHeight! * 0.9,
          child: Column(
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
                    "ADD FEMALE SERVICE",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 35,
              // ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.7,
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Category",
                          style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomFormField(
                          isEnabled: true,
                          height: 80,
                          width: double.infinity,
                          controller: categoryController),
                      // const SizedBox(
                      //   height: 12,
                      // ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Service Name",
                          style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomFormField(
                          isEnabled: true,
                          height: SizeConfig.screenHeight! * 0.06,
                          keyboardType: const TextInputType.numberWithOptions(),
                          width: double.infinity,
                          controller: serviceNameController),
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Service Duration",
                          style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomDropdown(
                              hintText: "Hours",
                              itemList:
                                  List.generate(12, (i) => (i + 1).toString()),
                              controller: hourController,
                              width: SizeConfig.screenWidth! * 0.25,
                              height: 40),
                          CustomDropdown(
                              hintText: "Minutes",
                              itemList:
                                  List.generate(59, (i) => (i + 1).toString()),
                              controller: hourController,
                              width: SizeConfig.screenWidth! * 0.3,
                              height: 40),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Pricing",
                          style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 40,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.only(left: 30, bottom: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.appViolet, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: rpController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: "Regular Price",
                                      hintStyle: TextStyle(
                                          color: AppColors.appViolet,
                                          fontSize: 10),
                                      border: InputBorder.none),
                                ),
                              ),
                              const Positioned(
                                top: 10,
                                left: 10,
                                child: Text(
                                  "₹ | ",
                                  style: TextStyle(color: AppColors.appViolet),
                                ),
                              )
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 40,
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.only(left: 30, bottom: 15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.appViolet, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: spController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      hintText: "Special Price",
                                      hintStyle: TextStyle(
                                          color: AppColors.appViolet,
                                          fontSize: 10),
                                      border: InputBorder.none),
                                ),
                              ),
                              const Positioned(
                                top: 10,
                                left: 10,
                                child: Text(
                                  "₹ | ",
                                  style: TextStyle(color: AppColors.appViolet),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      CustomDropdown(
                          hintText: "Max. Service Quantity",
                          itemList:
                              List.generate(12, (i) => (i + 1).toString()),
                          controller: maxServiceQuantController,
                          spaceBetweenTextAndIcon:
                              SizeConfig.screenWidth! * 0.25,
                          width: double.infinity,
                          height: 55),
                      const SizedBox(height: 40),
                      CustomFormField(
                          isEnabled: true,
                          borderSide: const BorderSide(
                              color: AppColors.appViolet, width: 1),
                          text: "Service Description",
                          hintTextStyle: const TextStyle(
                              color: AppColors.appViolet, fontSize: 15),
                          height: SizeConfig.screenHeight! * 0.06,
                          keyboardType: const TextInputType.numberWithOptions(),
                          width: double.infinity,
                          controller: descriptionController),
                      const SizedBox(height: 30),
                      Center(
                        child: SizedBox(
                          height: SizeConfig.screenHeight! * 0.055,
                          width: SizeConfig.screenWidth! * 0.42,
                          child: CustomButton(
                            text: "CONTINUE",
                            borderColor: AppColors.appBorderPurple,
                            textStyle: GoogleFonts.lateef(
                                fontWeight: FontWeight.w400, fontSize: 26),
                            onPressed: () {
                              if (mounted) {
                                print(hourController.text);
                                // Navigator.of(context)
                                //     .pushNamed(PageRoutes.serviceCategories);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}