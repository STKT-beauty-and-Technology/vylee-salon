import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/features/banking/view_model/get_bankdetails_cubit.dart';
import 'package:vylee_partner/features/banking/view_model/get_bankdetails_state.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../navigation/page_routes.dart';
import '../../../../themes/app_colors.dart';

class BankAccounts extends StatefulWidget {
  const BankAccounts({super.key});

  @override
  State<BankAccounts> createState() => _BankAccountsState();
}

class _BankAccountsState extends State<BankAccounts> {
  @override
  void initState() {
    context.read<GetBankdetailsCubit>().getBankDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: CustomButton(
        onPressed: () async {
          if (mounted) {
            Navigator.of(context).pushNamed(PageRoutes.addBankAccount);
          }
        },
        borderColor: AppColors.appViolet,
        bgcolor: AppColors.white,
        frontIcon: const Icon(Icons.add),
        frontIconSpacing: 10,
        fgcolor: AppColors.appViolet,
        text: "Add Bank Account",
      ),
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
                    "BANK ACCOUNTS",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              // Text(
              //   "No Data Found",
              //   style: GoogleFonts.inter(
              //     color: AppColors.appViolet,
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              BlocConsumer<GetBankdetailsCubit, GetBankdetailsState>(
                builder: (BuildContext context, state) {
                  if (state is! GetBankdetailsSuccessState) {
                    return const SizedBox();
                  }
                  return SizedBox(
                    height: 560,
                    child: ListView(
                        children: List.generate(
                      (state as GetBankdetailsSuccessState).bankDetails.length,
                      (index) {
                        final bankdetaill = state.bankDetails[index];
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.pinkLight),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 25),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Account Name:-",
                                        style: TextStyle(
                                            color: AppColors.themeColorPink,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        bankdetaill.accountHolderName ?? "",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Bank Account Number:-",
                                        style: TextStyle(
                                            color: AppColors.themeColorPink,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        bankdetaill.bankAccountNumber
                                            .toString(),
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Bank Name:-",
                                        style: TextStyle(
                                            color: AppColors.themeColorPink,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        bankdetaill.bankName ?? "",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "IFSC Code:-",
                                        style: TextStyle(
                                            color: AppColors.themeColorPink,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        bankdetaill.ifscCode ?? "",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Email Address:-",
                                        style: TextStyle(
                                            color: AppColors.themeColorPink,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        bankdetaill.emailAddress ?? "",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 8),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Mobile Number:-",
                                        style: TextStyle(
                                            color: AppColors.themeColorPink,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        bankdetaill.mobileNumber.toString(),
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, right: 15, top: 8, bottom: 25),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Address:-",
                                        style: TextStyle(
                                            color: AppColors.themeColorPink,
                                            fontSize: 13),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        bankdetaill.address ?? "",
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                  );
                },
                listener: (BuildContext context, GetBankdetailsState state) {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
