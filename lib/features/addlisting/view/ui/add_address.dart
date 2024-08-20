import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vylee_partner/common/common%20widgets/custom_form_field.dart';
import 'package:vylee_partner/navigation/page_routes.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../themes/app_colors.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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
                height: 5,
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
                    "YOUR ADDRESS",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 15,
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
                        height: 10,
                      ),
                      const Text(
                        "Enter Your Address",
                        style: TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight! * 0.16,
                        child: CustomFormField(
                            isEnabled: true,
                            height: 60,
                            keyboardType: TextInputType.multiline,
                            isMultiline: true,
                            width: double.infinity,
                            controller: addressController),
                      ),
                      // const Text(
                      //   "Country:",
                      //   style: TextStyle(
                      //       color: AppColors.appViolet,
                      //       fontWeight: FontWeight.w400,
                      //       fontSize: 15),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      CSCPicker(
                        disableCountry: false,
                        dropdownDecoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.appViolet, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        layout: Layout.vertical,
                        defaultCountry: CscCountry.India,
                        showStates: true,
                        onCountryChanged: (value) {},
                        showCities: true,
                        currentState: stateController.text,
                        currentCity: cityController.text,
                        onStateChanged: (value) {
                          setState(() {
                            stateController.text = value ?? "";
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            cityController.text = value ?? "";
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Pincode",
                        style: TextStyle(
                            color: AppColors.appViolet,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      const SizedBox(height: 10),
                      CustomFormField(
                          isEnabled: true,
                          height: 60,
                          keyboardType: const TextInputType.numberWithOptions(),
                          width: double.infinity,
                          controller: addressController),
                      const SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.validate();
                            if (mounted) {
                              Navigator.of(context)
                                  .pushNamed(PageRoutes.salonInformation);
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
                      // Center(
                      //   child: SizedBox(
                      //    height: 40 * SizeConfig.screenHeight!,
                      //     child: CustomButton(
                      //       text: "Sign Up",
                      //       textStyle: GoogleFonts.lateef(
                      //           fontWeight: FontWeight.w400, fontSize: 32),
                      //       onPressed: () {
                      //         _formKey.currentState!.validate();
                      //       },
                      //     ),
                      //   ),
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
