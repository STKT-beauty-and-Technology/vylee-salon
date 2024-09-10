import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/register/model/registration_request.dart';
import 'package:vylee_partner/features/register/view%20model/cubits/register_cubit.dart';
import 'package:vylee_partner/features/register/view%20model/cubits/register_state.dart';
import 'package:vylee_partner/features/register/view%20model/register_view_model.dart';
import 'package:vylee_partner/features/register/view/helpers/register_title_field.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';
import 'package:vylee_partner/utilities/string.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, this.userName});
  final String? userName;

  @override
  State<RegisterScreen> createState() => _State();
}

class _State extends State<RegisterScreen> with RegisterViewModel {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController salonNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    setState(() {
      emailController.text = widget.userName ?? "";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
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
            // height: SizeConfig.screenHeight! * 0.9,
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
                            const Text(" * ",
                                style: TextStyle(color: AppColors.red)),
                            Text(Constant.areMandatory),
                          ],
                        ),
                        RegisterTitleField(
                          controller: nameController,
                          title: Constant.fullName,
                          isMandatory: true,
                        ),
                        RegisterTitleField(
                          controller: salonNameController,
                          title: Constant.salonName,
                          isMandatory: true,
                        ),

                        RegisterTitleField(
                          controller: phoneController,
                          title: Constant.phone,
                          isMobile: true,
                          isMandatory: true,
                          inputType: const TextInputType.numberWithOptions(),
                        ),
                        RegisterTitleField(
                          controller: emailController,
                          title: Constant.mail,
                          isMandatory: true,
                          inputType: TextInputType.emailAddress,
                        ),
                        RegisterTitleField(
                          controller: passwordController,
                          title: Constant.password,
                          isMobile: false,
                          isMandatory: true,
                          inputType: TextInputType.visiblePassword,
                        ),
                        RegisterTitleField(
                          controller: confirmPasswordController,
                          title: Constant.confirmPassword,
                          isMobile: false,
                          isMandatory: true,
                          inputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: BlocConsumer<RegisterCubit, RegisterState>(
                            listener: (context, state) {
                              if (state is RegisterFailureState) {
                                Fluttertoast.showToast(msg: (state).error);
                              } else if (state is RegisterSuccessState) {
                                showToast("Registration Success");
                              }
                              if (mounted) {
                                Navigator.of(context).pushNamed(
                                    PageRoutes.homeScreen,
                                    arguments: {
                                      Constant.name: salonNameController.text
                                    });
                              }
                            },
                            builder: (context, state) {
                              if (state is RegisterLoadingState) {
                                return const CircularProgressIndicator();
                              }
                              return ElevatedButton(
                                onPressed: () async {
                                  if (confirmPasswordController.text !=
                                      passwordController.text) {
                                    showToast(
                                        "confirm password and password should be same.");
                                    return;
                                  }
                                  if (_formKey.currentState!.validate()) {
                                    await context
                                        .read<RegisterCubit>()
                                        .registerVendor(RegistrationRequest(
                                          fullName: nameController.text,
                                          mobileNumber: int.tryParse(
                                              phoneController.text),
                                          salonName: salonNameController.text,
                                          vendorEmail: emailController.text,
                                        ));
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
                                      Constant.submit,
                                      style: const TextStyle(
                                          color: AppColors.white, fontSize: 22),
                                    )),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 30),
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
