import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/common/common%20widgets/custom_form_field.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/addlisting/view%20model/listing_view_model.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';
import 'package:vylee_partner/utilities/string.dart';

class SalonInformation extends StatefulWidget {
  const SalonInformation({super.key, this.isEdit});
  final bool? isEdit;

  @override
  State<SalonInformation> createState() => _SalonInformationState();
}

class _SalonInformationState extends State<SalonInformation>
    with ListingViewModel {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController whatsappNumberController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salonNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? image;
  bool imagePicked = false;
  bool emailVerified = false;
  @override
  void initState() {
    super.initState();
  }

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
                          controller: whatsappNumberController),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 5.0),
                            child: Text(
                              "Listing Logo",
                              style: TextStyle(color: AppColors.appViolet),
                            ),
                          ),
                          const SizedBox(height: 5),
                          !imagePicked || image == null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: SizeConfig.screenWidth! * 0.3,
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
                                        textStyle:
                                            const TextStyle(fontSize: 10),
                                        frontIcon: const Padding(
                                          padding: EdgeInsets.only(right: 2),
                                          child: Icon(
                                            Icons.image_outlined,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text(
                                      " (Maximum File Size: 2 MB)",
                                      style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 9,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                )
                              : Container(
                                  height: 60,
                                  decoration: const BoxDecoration(
                                      color: AppColors.gray600),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Image.file(
                                          image!,
                                          fit: BoxFit.fill,
                                          width: 50,
                                          height: 40,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              imagePicked = false;
                                              image = null;
                                            });
                                          },
                                          icon: const Icon(Icons.close))
                                    ],
                                  ),
                                ),
                        ],
                      ),

                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        Constant.fullName,
                        style: const TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      CustomFormField(
                          isEnabled: true,
                          height: 60,
                          keyboardType: TextInputType.name,
                          width: double.infinity,
                          controller: nameController),
                      const SizedBox(height: 15),
                      Text(
                        Constant.salonName,
                        style: const TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      CustomFormField(
                          isEnabled: true,
                          height: 60,
                          keyboardType: TextInputType.text,
                          width: double.infinity,
                          controller: salonNameController),
                      const SizedBox(height: 15),
                      Text(
                        Constant.phone,
                        style: const TextStyle(
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
                      Text(
                        Constant.mail,
                        style: const TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      CustomFormField(
                          isEnabled: true,
                          height: 60,
                          onChanged: () {
                            setState(() {
                              emailVerified = false;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                          width: double.infinity,
                          controller: emailController),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () async {
                            //call api for email verification,
                            emailVerified =
                                await verifyEmail(emailController.text);
                            setState(() {
                              emailVerified;
                            });
                          },
                          child: Text(
                            emailVerified
                                ? Constant.verified
                                : Constant.verifyEmail,
                            style: const TextStyle(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700,
                                fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      // const SizedBox(height: 10),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.validate();

                            if (checkValidation()) {
                              if (widget.isEdit != true) {
                              Navigator.of(context)
                                  .pushNamed(PageRoutes.workingHours);
                            } else {
                              Navigator.of(context).pop();
                            }
                            }
                           
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appViolet,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 0),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 10.0),
                              child: Text(
                                widget.isEdit == true ? "Save" : "CONTINUE",
                                style: const TextStyle(
                                    color: AppColors.white, fontSize: 22),
                              )),
                        ),
                      )
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

  bool checkValidation() {
    if (descriptionController.text.isEmpty ||
        websiteController.text.isEmpty ||
        whatsappNumberController.text.isEmpty ||
        nameController.text.isEmpty ||
        salonNameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields to Save");
      return false;
    }

    if (image == null) {
      Fluttertoast.showToast(msg: "Add Logo first");
      return false;
    }

    return true;
  }
}
