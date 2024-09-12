import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/login/model/login_request.dart';
import 'package:vylee_partner/features/login/view_model/cubits/login_cubit.dart';
import 'package:vylee_partner/features/login/view_model/cubits/login_state.dart';
import 'package:vylee_partner/themes/app_colors.dart';
import 'package:vylee_partner/utilities/string.dart';

import '../../../../core/path/image_path.dart';
import '../../../../navigation/page_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _passwordVisible = false;
  bool termsAccepted = false;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            color: AppColors.appPurple,
            child: Stack(
              children: [
                Positioned(
                  left: SizeConfig.widthMultiplier! * 10,
                  top: SizeConfig.screenHeight! * 0.25,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      ImagePath.loginBackground,
                      width: SizeConfig.screenWidth! * 0.95,
                      height: SizeConfig.screenHeight! * 0.72,
                      fit: BoxFit.fill,
                      colorBlendMode: BlendMode.color,
                      color: AppColors.appViolet,
                    ),
                  ),
                ),
                Container(
                  color: AppColors.appGray.withOpacity(0.6),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                ),
                Center(
                  child: UnconstrainedBox(
                    child: SizedBox(
                      width: SizeConfig.widthMultiplier! * 300,
                      height: SizeConfig.screenHeight,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Center(
                              child: ImageLoader.asset(
                                ImagePath.vyleeTextLogo,
                                height: 200,
                                width: 250,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SvgPicture.asset(ImagePath.avatarIcon),
                            const SizedBox(
                              height: 20,
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: SizeConfig.screenWidth! * 0.7,
                                  height: 55,
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                        color: AppColors.gray600, width: 3),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    controller: userNameController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Email is Mandatory";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: Constant.enterUsername,
                                        fillColor: AppColors.white,
                                        hintStyle: GoogleFonts.inter(
                                            color: AppColors.black,
                                            fontSize: 15),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Stack(
                              children: [
                                Container(
                                  width: SizeConfig.screenWidth! * 0.7,
                                  height: 55,
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(
                                      left: 10, bottom: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                        color: AppColors.gray600, width: 3),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: TextFormField(
                                    obscureText: !_passwordVisible  ,
                                    controller: passwordController,
                                    keyboardType: TextInputType.text ,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Password is Mandatory";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: Constant.enterPassword,
                                        fillColor: AppColors.white,
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: AppColors.black,
                                          ), onPressed: () {
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                        ),
                                        hintStyle: GoogleFonts.inter(
                                            color: AppColors.black,
                                            fontSize: 15),
                                        // icon: IconButton(
                                        //   icon: Icon(
                                        //     _obscureText ? Icons.visibility : Icons.visibility_off,
                                        //   ),
                                        //   onPressed: _togglePasswordVisibility,
                                        // ),
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 30, top: 5),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () {
                                    if (userNameController.text.isEmpty) {
                                      showToast(
                                          "Enter Registered email to get OTP");
                                      return;
                                    } else if (!userNameController.text
                                        .isValidEmail()) {
                                      showToast(
                                          "Enter proper email format to get OTP");
                                      return;
                                    }
                                    Navigator.pushNamed(
                                        context, PageRoutes.otpScreen,
                                        arguments: {
                                          Constant.mobileNumber:
                                              userNameController.text
                                        });
                                  },
                                  child: Text(
                                    Constant.forgotPassword,
                                    style: GoogleFonts.inter(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Center(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      border: Border.all(
                                          color: AppColors.gray600, width: 5)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4, top: 3, bottom: 3),
                                    child: SizedBox(
                                      width: SizeConfig.screenWidth! * 0.7,
                                      height: 50,
                                      child:
                                          BlocConsumer<LoginCubit, LoginState>(
                                        listener: (context, state) {
                                          if (state is LoginFailureState) {
                                            showToast(state.error);
                                          } else if (state
                                              is LoginSuccessState) {
                                            if (mounted) {
                                              Navigator.of(context).pushNamed(
                                                  PageRoutes.homeScreen,
                                                  arguments: {
                                                    Constant.name:
                                                        "Call Name API"
                                                  });
                                            }
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is LoginLoadingState) {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                          return ElevatedButton(
                                            onPressed: () async {
                                              if(passwordController.text.isEmpty && userNameController.text.isEmpty){
                                                showToast(
                                                    "Enter Username and Password first");
                                              }
                                              else {
                                                if (_formKey.currentState!
                                                    .validate()) {
                                                  await context
                                                      .read<LoginCubit>()
                                                      .loginVendor(LoginRequest(
                                                      email:
                                                      userNameController
                                                          .text,
                                                      password:
                                                      passwordController
                                                          .text));
                                                }
                                            }
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.appViolet,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                elevation: 0),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 10.0),
                                                child: Text(
                                                  Constant.login,
                                                  style: GoogleFonts.inter(
                                                    color: AppColors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16,
                                                  ),
                                                )),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  Constant.dontHaveAccount,
                                  style: GoogleFonts.inter(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                ),
                                const SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, PageRoutes.registrationScreen,
                                        arguments: {
                                          Constant.mobileNumber:
                                              userNameController.text
                                        });
                                  },
                                  child: Text(
                                    Constant.signUp,
                                    style: GoogleFonts.inter(
                                        decoration: TextDecoration.underline,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 65),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  Constant.byContinuing,
                                  style: GoogleFonts.inter(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  Constant.termsPrivacy,
                                  style: GoogleFonts.inter(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
