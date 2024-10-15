import 'package:flutter/material.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';

import '../../../../common/common widgets/custom_button.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageLoader.asset(height: 300, width: 300, ImagePath.successGif),
          const Center(
            child: Text(
              "Details Added Successfully",
              style: TextStyle(
                  fontSize: 30,
                  color: AppColors.themeColorPink,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomButton(
              text: "OK",
              textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
              borderRadius: 5,
              bgcolor: AppColors.white,
              fgcolor: AppColors.black,
              borderColor: AppColors.appViolet,
              onPressed: () {
                if (mounted) {
                  Navigator.of(context)
                      .pushNamed(PageRoutes.accountInformation);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
