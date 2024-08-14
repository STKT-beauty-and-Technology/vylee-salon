import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../themes/app_colors.dart';
import '../../../register/view/helpers/register_title_field.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salonNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
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
                height: 15,
              ),
              const Text(
                "YOUR ADDRESS",
                style: TextStyle(
                    color: AppColors.appViolet,
                    fontWeight: FontWeight.w400,
                    fontSize: 28),
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                width: SizeConfig.screenWidth! * 0.7,
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Text("Fields marked with",),
                          Text(" * ",style: TextStyle(color: AppColors.red)),
                          Text("are Mandatory"),
                        ],
                      ),
                      RegisterTitleField(
                        controller: nameController,
                        title: "Full Name",
                      ),
                      RegisterTitleField(
                        controller: salonNameController,
                        title: "Salon Name",
                      ),
                      RegisterTitleField(
                        controller: emailController,
                        title: "Email Address",
                      ),
                      RegisterTitleField(
                        controller: phoneController,
                        title: "Phone Number",
                        inputType: const TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.validate();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appViolet,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 0),
                          child: const Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
                              child:
                              Text("SIGN UP" , style: TextStyle(color: AppColors.white,fontSize: 22),)
                          ),
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
