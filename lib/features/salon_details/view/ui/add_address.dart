import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vylee_partner/common/common%20widgets/custom_form_field.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/features/salon_details/model/address_request.dart';
import 'package:vylee_partner/features/salon_details/view_model/cubits/address_cubit.dart';
import 'package:vylee_partner/features/salon_details/view_model/cubits/address_state.dart';
import 'package:vylee_partner/navigation/page_routes.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../themes/app_colors.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key, this.isEdit});
  final bool? isEdit;

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(),
      child: Scaffold(
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
                              isRequired: true,
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
                          disableCountry: true,
                          dropdownDecoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.appViolet, width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          layout: Layout.vertical,
                          defaultCountry: CscCountry.India,
                          showStates: true,
                          onCountryChanged: (value) {},
                          showCities: false,
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
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomFormField(
                            isEnabled: true,
                            height: 60,
                            isMultiline: false,
                            isRequired: true,
                            keyboardType: TextInputType.number,
                            width: double.infinity,
                            controller: pincodeController),
                        const SizedBox(height: 30),
                        Center(
                          child: BlocConsumer<AddressCubit, AddressState>(
                            listener: (context, state) {
                              if (state is AddressFailureState) {
                                showToast((state).error);
                              } else if (state is AddressSuccessState) {
                                showToast("Address Saved");
                              }
                              if (mounted) {
                                if (widget.isEdit != true) {
                                  Navigator.of(context)
                                      .pushNamed(PageRoutes.workingHours);
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                            builder: (context, state) {
                              if (state is AddressLoadingState) {
                                return const CircularProgressIndicator();
                              }
                              return ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await context
                                        .read<AddressCubit>()
                                        .saveAddress(
                                          AddressRequest(
                                            vendorAddress:
                                                addressController.text,
                                            pincode: int.tryParse(
                                                pincodeController.text),
                                            vendorState: stateController.text,
                                            vensorCity: cityController.text,
                                          ),
                                        );
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
                                      widget.isEdit == true
                                          ? "SAVE"
                                          : "CONTINUE",
                                      style: const TextStyle(
                                          color: AppColors.white, fontSize: 22),
                                    )),
                              );
                            },
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
      ),
    );
  }
}
