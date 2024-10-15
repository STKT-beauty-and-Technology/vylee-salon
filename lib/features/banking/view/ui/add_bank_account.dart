import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vylee_partner/features/banking/model/add_bankAccount_request.dart';
import 'package:vylee_partner/features/banking/view_model/addBank_cubit.dart';
import 'package:vylee_partner/features/banking/view_model/addBank_state.dart';

import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../common/utitlties/common_utilities.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../navigation/page_routes.dart';
import '../../../../themes/app_colors.dart';

class AddBankAccount extends StatefulWidget {
  const AddBankAccount({super.key, this.isEdit});
  final bool? isEdit;

  @override
  State<AddBankAccount> createState() => _AddBankAccountState();
}

class _AddBankAccountState extends State<AddBankAccount> {
  final TextEditingController accountHolderController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController AddressController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBankCubit(),
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
                      const Text("Account Holder Name",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: TextField(
                          maxLines: 5,
                          controller: accountHolderController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Bank Account Number",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: TextField(
                          maxLines: 5,
                          controller: accountNumberController,
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration: const InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Re-Enter Bank Account Number",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: const TextField(
                          maxLines: 5,
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Bank name",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: TextField(
                          maxLines: 5,
                          controller: bankNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("IFSC Code",
                          style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: TextField(
                          maxLines: 5,
                          controller: ifscCodeController,
                          decoration: const InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Email Address",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: TextField(
                          maxLines: 5,
                          controller: emailAddressController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Mobile Number",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: TextField(
                          maxLines: 5,
                          controller: mobileNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("address( house, flat, block no.)",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: TextField(
                          maxLines: 5,
                          controller: AddressController,
                          keyboardType: TextInputType.streetAddress,
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("Pincode",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: const TextField(
                          maxLines: 5,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("City",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: const TextField(
                          maxLines: 5,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              fillColor: AppColors.textFieldColor),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text("State",
                          style: TextStyle(color: AppColors.appViolet)),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: SizeConfig.heightMultiplier! * 42,
                        child: const TextField(
                          maxLines: 5,
                          keyboardType: TextInputType.text,
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
                  child: BlocConsumer<AddBankCubit, AddBankState>(
                    listener: (context, state) {
                      if (state is AddBankInitialState) {
                      } else if (state is AddBankSuccessState) {
                        showToast("Bank Details Added Successfully");
                        if (mounted) {
                          if (widget.isEdit != true) {
                            Navigator.of(context)
                                .pushNamed(PageRoutes.bankAccounts);
                          } else {
                            Navigator.of(context).pop();
                          }
                        }
                      }
                    },
                    builder: (context, state) {
                      if (state is AddBankLoadingState) {
                        return const CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          await context.read<AddBankCubit>().addBankDetail(
                                AddBankAccountRequest(
                                  accountHolderName:
                                      accountHolderController.text,
                                  bankAccountNumber: int.tryParse(
                                      accountNumberController.text),
                                  bankName: bankNameController.text,
                                  ifscCode: ifscCodeController.text,
                                  emailAddress: emailAddressController.text,
                                  mobileNumber:
                                      int.tryParse(mobileNumberController.text),
                                  address: AddressController.text,
                                ),
                              );
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
                              "SAVE",
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 22),
                            )),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
