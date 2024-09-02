import 'package:flutter/material.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/register/view/helpers/register_title_field.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';
import 'package:vylee_partner/utilities/string.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _State();
}

class _State extends State<RegisterScreen> {
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
            height: 20,
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
               Text(
                Constant.vendorRegister,
                style: const TextStyle(
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
                       Row(
                        children: [
                          Text(
                            Constant.fieldsMarked,
                          ),
                          const Text(" * ", style: TextStyle(color: AppColors.red)),
                          Text(Constant.areMandatory),
                        ],
                      ),
                      RegisterTitleField(
                        controller: nameController,
                        title: Constant.fullName,
                      ),
                      RegisterTitleField(
                        controller: salonNameController,
                        title: Constant.salonName,
                      ),
                      RegisterTitleField(
                        controller: emailController,
                        title: Constant.email,
                      ),
                      RegisterTitleField(
                        controller: phoneController,
                        title: Constant.phone,
                        inputType: const TextInputType.numberWithOptions(),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _formKey.currentState!.validate();
                            if (mounted) {
                              Navigator.of(context).pushNamed(
                                  PageRoutes.welcomeScreen,
                                  arguments: {
                                    Constant.name: salonNameController.text
                                  });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.appViolet,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              elevation: 0),
                          child:  Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 10.0),
                              child:Text(
                                Constant.signUp,
                                style: const TextStyle(
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
