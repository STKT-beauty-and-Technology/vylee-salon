import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/bookings/view%20model/bookings_view_model.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class FreeSlots extends StatefulWidget {
  const FreeSlots({super.key, required this.date});
  final DateTime date;

  @override
  State<FreeSlots> createState() => _FreeSlotsState();
}

class _FreeSlotsState extends State<FreeSlots> with BookingsViewModel {
  final freeSlots = [
    [
      const TimeOfDay(hour: 10, minute: 30),
      const TimeOfDay(hour: 11, minute: 30)
    ],
    [
      const TimeOfDay(hour: 16, minute: 30),
      const TimeOfDay(hour: 17, minute: 00)
    ],
    [
      const TimeOfDay(hour: 19, minute: 00),
      const TimeOfDay(hour: 19, minute: 30)
    ],
  ];
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
        child: Column(
          children: [
            const SizedBox(
              height: 10,
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
                const SizedBox(width: 8),
                Text(
                  "FREE SLOTS ON ${DateFormat.yMd().format(widget.date)}",
                  style: const TextStyle(
                      color: AppColors.appViolet,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ...List.generate(freeSlots.length, (index) {
              return Container(
                width: SizeConfig.screenWidth! * 0.8,
                margin: const EdgeInsets.all(20),
                height: 80,
                alignment: Alignment.center,
                color: AppColors.grayf0,
                child: Text(
                  getFreeSlotsString(freeSlots[index]),
                  style: const TextStyle(
                      color: AppColors.appViolet,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
