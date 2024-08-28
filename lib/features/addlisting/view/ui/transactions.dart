import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  int currentTab = 0;
  List<String> tabs = ["Earning", "Refunds", "Withdrawals"];
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
                    "TRANSACTION",
                    style: TextStyle(
                        color: AppColors.appViolet,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DefaultTabController(
                length: 3,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  onTap: (value) {
                    setState(() {
                      currentTab = value;
                    });
                  },
                  tabs: [
                    Tab(
                      child: Text(tabs[0],
                          style: GoogleFonts.inter(
                            color: AppColors.appViolet,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.appViolet,
                          )),
                    ),
                    Tab(
                      child: Text(tabs[1],
                          style: GoogleFonts.inter(
                            color: AppColors.appViolet,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.appViolet,
                          )),
                    ),
                    Tab(
                      child: Text(tabs[2],
                          style: GoogleFonts.inter(
                            color: AppColors.appViolet,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.appViolet,
                          )),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "No ${tabs[currentTab]} Data Found",
                  style: GoogleFonts.inter(
                    color: AppColors.appViolet,
                    fontWeight: FontWeight.w500,
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
