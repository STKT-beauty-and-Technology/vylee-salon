import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class UploadDocuments extends StatefulWidget {
  const UploadDocuments({super.key});

  @override
  State<UploadDocuments> createState() => _UploadDocumentsState();
}

class _UploadDocumentsState extends State<UploadDocuments> {
  final ImagePicker picker = ImagePicker();
  String? idProofType;
  File? agreementImage;
  File? idProofImage;
  bool agreementImagePicked = false;
  bool idProofImagePicked = false;
  final List<String> idProofsEligible = [
    "Driving License",
    "Pan Card",
    "Aadhar Card",
    "Passport",
    "Voter Id"
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
                    "UPLOAD BUSINESS DOCUMENTS",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.8,
                // height: SizeConfig.screenHeight! * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.black,
                          child: Text(
                            "1",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Upload identity proof",
                          style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () async {
                        await showModalBottomSheet(
                            context: context,
                            backgroundColor: AppColors.gray600,
                            builder: (context) {
                              return SizedBox(
                                height: SizeConfig.screenHeight! * 0.45,
                                child: Column(
                                  children: [
                                    Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(20),
                                        color: const Color.fromARGB(
                                            255, 172, 172, 172),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Upload Identity Proof",
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        )),
                                    ...List.generate(5, (index) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              idProofsEligible[index],
                                              style: GoogleFonts.inter(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            onTap: () async {
                                              Navigator.of(context).pop();
                                              final pickedImage =
                                                  await picker.pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              if (pickedImage != null) {
                                                final file =
                                                    File(pickedImage.path);
                                                setState(() {
                                                  idProofImagePicked = true;
                                                  idProofImage = file;
                                                  idProofType =
                                                      idProofsEligible[index];
                                                });
                                              }
                                            },
                                          ),
                                          const Divider(
                                            color: Color.fromARGB(
                                                255, 172, 172, 172),
                                            height: 2,
                                          )
                                        ],
                                      );
                                    })
                                  ],
                                ),
                              );
                            });
                      },
                      child: !idProofImagePicked || idProofImage == null
                          ? Stack(
                              fit: StackFit.loose,
                              children: [
                                Container(
                                  width: SizeConfig.screenWidth! * 0.8,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.appViolet, width: 2),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                const Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColors.black,
                                    size: 30,
                                  ),
                                )
                              ],
                            )
                          : Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.appViolet, width: 2),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    idProofType ?? "",
                                    style: const TextStyle(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                  Image.file(
                                    idProofImage!,
                                    fit: BoxFit.fitHeight,
                                    height: 200,
                                  ),
                                ],
                              ),
                            ),
                    ),
                    const SizedBox(height: 50),
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.black,
                          child: Text(
                            "2",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          "Upload shop registration/leased agreement",
                          style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    DottedBorder(
                      borderType: BorderType.Rect,
                      child: Container(
                        height: SizeConfig.screenHeight! * 0.2,
                        width: SizeConfig.screenWidth! * 0.8,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () async {
                            final pickedImage = await picker.pickImage(
                                source: ImageSource.gallery);
                            if (pickedImage != null) {
                              final file = File(pickedImage.path);
                              setState(() {
                                agreementImagePicked = true;
                                agreementImage = file;
                              });
                            }
                          },
                          child: !agreementImagePicked || agreementImage == null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.camera_alt_sharp,
                                      size: 20,
                                      color: AppColors.black,
                                    ),
                                    Text(
                                      " Add shop registration/Leased Agreement or any other established registration document",
                                      style: GoogleFonts.inter(
                                        color: AppColors.appViolet,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                )
                              : Center(
                                  child: GestureDetector(
                                    onTap: () async {
                                      final pickedImage =
                                          await picker.pickImage(
                                              source: ImageSource.gallery);
                                      if (pickedImage != null) {
                                        final file = File(pickedImage.path);
                                        setState(() {
                                          agreementImagePicked = true;
                                          agreementImage = file;
                                        });
                                      }
                                    },
                                    child: Image.file(
                                      agreementImage!,
                                      fit: BoxFit.fill,
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 125,
                          child: CustomButton(
                            text: "SKIP",
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            borderRadius: 5,
                            bgcolor: AppColors.white,
                            fgcolor: AppColors.black,
                            borderColor: AppColors.appViolet,
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          width: 125,
                          child: CustomButton(
                            text: "CONTINUE",
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            borderRadius: 5,
                            bgcolor: AppColors.appViolet,
                            fgcolor: AppColors.white,
                            borderColor: AppColors.appViolet,
                            onPressed: () {
                              if (mounted) {
                                Navigator.of(context)
                                    .pushNamed(PageRoutes.availableSlots);
                              }
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
