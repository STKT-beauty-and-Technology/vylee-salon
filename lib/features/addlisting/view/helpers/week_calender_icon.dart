import 'package:flutter/material.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class WeekCalenderIcon extends StatelessWidget {
  const WeekCalenderIcon(
      {super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.2,
            decoration: const BoxDecoration(
                color: AppColors.maroon,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Row(
              children: [
                const Spacer(flex: 1),
                CircleAvatar(
                  radius: width * 0.08,
                  backgroundColor: AppColors.blue,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: width * 0.06,
                  ),
                ),
                const Spacer(flex: 2),
                CircleAvatar(
                  radius: width * 0.08,
                  backgroundColor: AppColors.blue,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: width * 0.06,
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
