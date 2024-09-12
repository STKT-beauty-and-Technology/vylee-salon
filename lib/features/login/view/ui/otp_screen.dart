import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/utitlties/common_utilities.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/login/model/otp_request.dart';
import 'package:vylee_partner/features/login/model/validate_otp_request.dart';
import 'package:vylee_partner/features/login/view_model/cubits/otp_cubit.dart';
import 'package:vylee_partner/features/login/view_model/cubits/otp_state.dart';
import 'package:vylee_partner/themes/app_colors.dart';
import 'package:vylee_partner/utilities/string.dart';

import '../../../../core/path/image_path.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.mobileNumber});
  final String mobileNumber;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool termsAccepted = false;
  bool _obscureText = true;
  bool _passwordVisible = false;
  final TextEditingController passwordController = TextEditingController();
  String otp = "";

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
    BlocProvider.of<OtpCubit>(context)
        .sendOtp(OtpRequest(email: widget.mobileNumber));
  }
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          color: AppColors.appViolet,
          child: Stack(
            children: [
              // Positioned(
              //   left: SizeConfig.widthMultiplier! * 10,
              //   top: SizeConfig.screenHeight! * 0.3,
              //   child: Image.asset(
              //     ImagePath.loginBackground,
              //     width: SizeConfig.screenWidth! * 0.95,
              //     height: SizeConfig.screenHeight! * 0.68,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              Center(
                child: SizedBox(
                  //A non-constrained impose over its child to gain control of its natural size.
                  child: UnconstrainedBox(
                    child: SizedBox(
                      width: SizeConfig.screenWidth! * 0.85,
                      height: SizeConfig.screenHeight,
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
                          SvgPicture.asset(ImagePath.avatarIcon),
                          const SizedBox(height: 10),
                          Text(
                            Constant.otpVerify,
                            style: GoogleFonts.frankRuhlLibre(
                                textStyle:
                                    const TextStyle(color: AppColors.black),
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Enter the OTP sent to ${widget.mobileNumber}",
                                style: GoogleFonts.frankRuhlLibre(
                                    textStyle:
                                        const TextStyle(color: AppColors.black),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                              IconButton(
                                  padding: const EdgeInsets.all(2),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Image.asset(ImagePath.editIcon))
                            ],
                          ),
                          OtpTextField(
                            numberOfFields: 4,
                            margin: const EdgeInsets.all(13),
                            // contentPadding: const EdgeInsets.all(20),
                            fieldWidth: SizeConfig.screenWidth! * 0.13,
                            enabled: true,
                            filled: true,
                            decoration: const InputDecoration(
                                fillColor: AppColors.white, filled: true),
                            showFieldAsBox: true,
                            onCodeChanged: (String code) {
                              //handle validation or checks here
                            },
                            onSubmit: (String verificationCode) {
                              setState(() {
                                otp = verificationCode;
                              });
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  Constant.codeNotReceived,
                                  style: GoogleFonts.inter(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(4)),
                                  onPressed: () async {
                                    await context.read<OtpCubit>().sendOtp(
                                        OtpRequest(email: widget.mobileNumber));
                                  },
                                  child: Text(
                                    Constant.resendCode,
                                    style: GoogleFonts.inter(
                                      color: AppColors.black,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            "Enter New Password",
                            style: GoogleFonts.frankRuhlLibre(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(height: 8),
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
                          // CustomTextField(
                          //     isEnabled: true,
                          //     height: 60,
                          //     width: SizeConfig.screenWidth! * 0.7,
                          //     controller: passwordController),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Center(
                              child: SizedBox(
                                child: BlocConsumer<OtpCubit, OtpState>(
                                  listener: (context, state) {
                                    if (state is OtpFailureState) {
                                      showToast(state.error);
                                    } else if (state is OtpSuccessState) {
                                      showToast("Login with new password");
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is OtpLoadingState) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    return ElevatedButton(
                                      onPressed: () async {
                                        if (otp.isEmpty) {
                                          showToast("Enter OTP");
                                          return;
                                        } else if (passwordController
                                            .text.isEmpty) {
                                          showToast("Enter New Password");
                                          return;
                                        }
                                        await context
                                            .read<OtpCubit>()
                                            .validateOtp(ValidateOtpRequest(
                                                email: widget.mobileNumber,
                                                password:
                                                    passwordController.text,
                                                otp: otp));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: const BorderSide(
                                                  color: AppColors.white)),
                                          elevation: 0),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 10.0),
                                          child: Text(
                                            Constant.submit,
                                            style: GoogleFonts.inter(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                            ),
                                          )),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
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
    );
  }
}
