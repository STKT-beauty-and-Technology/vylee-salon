import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/common/common%20widgets/custom_form_field.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../navigation/page_routes.dart';
import '../../../../themes/app_colors.dart';

class SalonInformation extends StatefulWidget {
  const SalonInformation({super.key});

  @override
  State<SalonInformation> createState() => _SalonInformationState();
}

class _SalonInformationState extends State<SalonInformation> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ImagePicker picker = ImagePicker();
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
                height: 10,
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
                        size: 20,
                        weight: 100,
                        color: AppColors.appViolet,
                      )),
                  const Text(
                    "SALON INFORMATION",
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
                      const Text(
                        "Salon Description",
                        style: TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.16,
                        child: CustomFormField(
                            isEnabled: true,
                            height: 60,
                            keyboardType: TextInputType.multiline,
                            isMultiline: true,
                            width: double.infinity,
                            controller: descriptionController),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Company Website",
                        style: TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      CustomFormField(
                          isEnabled: true,
                          height: 60,
                          width: double.infinity,
                          controller: websiteController),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Whatsapp Number",
                        style: TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      CustomFormField(
                          isEnabled: true,
                          height: 60,
                          keyboardType: const TextInputType.numberWithOptions(),
                          width: double.infinity,
                          controller: phoneController),
                      const SizedBox(height: 15),
                      !imagePicked || image == null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 5.0),
                                  child: Text(
                                    "Listing Logo",
                                    style:
                                        TextStyle(color: AppColors.appViolet),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: SizeConfig.screenWidth! * 0.4,
                                  child: CustomButton(
                                    onPressed: () async {
                                      final pickedImage =
                                          await picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (pickedImage != null) {
                                        final file = File(pickedImage.path);
                                        setState(() {
                                          imagePicked = true;
                                          image = file;
                                        });
                                      }
                                    },
                                    text: "Upload File",
                                    textStyle: const TextStyle(fontSize: 10),
                                    iconAtFront: true,
                                    icon: const Padding(
                                      padding: EdgeInsets.only(right: 2),
                                      child: Icon(
                                        Icons.image_outlined,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  " (Maximum File Size: 2 MB)",
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                              ],
                            )
                          : Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Listing Logo",
                                    style:
                                        TextStyle(color: AppColors.appViolet,fontWeight: FontWeight.bold ,fontSize: 18),
                                  ),
                                  const SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () async {
                                      final pickedImage =
                                          await picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (pickedImage != null) {
                                        final file = File(pickedImage.path);
                                        setState(() {
                                          imagePicked = true;
                                          image = file;
                                        });
                                      }
                                    },
                                    child: ClipOval(
                                      child: Image.file(
                                        image!,
                                        fit: BoxFit.fill,
                                        width: 120,
                                        height: 120,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: 40,
                      ),
                      // const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.validate();
                            if (mounted) {
                              Navigator.of(context)
                                  .pushNamed(PageRoutes.workingHours);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appViolet,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 0),
                          child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 10.0),
                              child: Text(
                                "CONTINUE",
                                style: TextStyle(
                                    color: AppColors.white, fontSize: 22),
                              )),
                        ),
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     // CustomButton(
                      //     //   text: "BACK",
                      //     //   textStyle: const TextStyle(
                      //     //     fontWeight: FontWeight.w500,
                      //     //   ),
                      //     //   borderRadius: 1,
                      //     //   onPressed: () {
                      //     //     if (mounted) {
                      //     //       Navigator.of(context).pop();
                      //     //     }
                      //     //   },
                      //     // ),
                      //     // CustomButton(
                      //     //   text: "NEXT",
                      //     //   borderRadius: 1,
                      //     //   textStyle: const TextStyle(
                      //     //     fontWeight: FontWeight.w500,
                      //     //   ),
                      //     //   onPressed: () {
                      //     //     if (mounted) {
                      //     //       Navigator.of(context)
                      //     //           .pushNamed("working-hours");
                      //     //     }
                      //     //   },
                      //     // )
                      //   ],
                      // )
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
