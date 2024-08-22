import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/addlisting/view/helpers/available_slot_card.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class AvailableSlots extends StatefulWidget {
  const AvailableSlots({super.key});

  @override
  State<AvailableSlots> createState() => _AvailableSlotsState();
}

class _AvailableSlotsState extends State<AvailableSlots> {
  final ImagePicker picker = ImagePicker();
  String? idProofType;
  File? agreementImage;
  File? idProofImage;
  bool agreementImagePicked = false;
  bool idProofImagePicked = false;
  final List<List<TimeOfDay?>> slots = [
    [null, null],
    [null, null],
    [null, null],
    [null, null],
    [null, null],
    [null, null],
    [null, null],
  ];
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
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
          // height: SizeConfig.screenHeight! * 0.9,
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
                    "Available Slots",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  ...List.generate(7, (index) {
                    return AvailableSlotCard(
                      onAddPressed: (TimeOfDay? begin, TimeOfDay? end) {
                        if (begin == null || end == null) {
                          Fluttertoast.showToast(msg: "Add Both the slots");
                          return;
                        }
                        setState(() {
                          slots[index] = [begin, end];
                        });
                      },
                      day: days[index],
                      isAdded: !slots[index].contains(null),
                    );
                  }),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.8,
                    child: Center(
                      child: Row(
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
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
