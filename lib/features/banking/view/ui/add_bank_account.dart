import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/navigation/page_routes.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../themes/app_colors.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({super.key});

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
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
                    "ADD BANK ACCOUNTS",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 15),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Account Holder Name",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Bank Account Number",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Re-Enter Bank Account Number",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Bank name",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.name,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("IFSC Code",style: TextStyle(color: AppColors.appViolet,fontWeight: FontWeight.w500)),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Email Address",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.emailAddress,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Mobile Number",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("address( house, flat, block no.)",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.streetAddress,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Pincode",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.number,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("City",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("State",style: TextStyle(color: AppColors.appViolet)),
                    const SizedBox(height: 5,),
                    SizedBox(
                      height: SizeConfig.heightMultiplier! * 42,
                      child: const TextField(
                        maxLines: 5,
                        keyboardType:
                        TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            fillColor: AppColors.textFieldColor),
                      ),
                    ),
                  ],
                               ),
              ),
              const SizedBox(height: 30),
              Center(
                child: SizedBox(
                  height: SizeConfig.screenHeight! * 0.055,
                  width: SizeConfig.screenWidth! * 0.42,
                  child: CustomButton(
                    text: "SAVE",
                    borderColor: AppColors.appBorderPurple,
                    textStyle: GoogleFonts.lateef(
                        fontWeight: FontWeight.w400, fontSize: 26),
                    onPressed: () {
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}
