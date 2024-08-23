import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../themes/app_colors.dart';

class WorkingHours extends StatefulWidget {
  const WorkingHours({super.key});

  @override
  State<WorkingHours> createState() => _WorkingHoursState();
}

class _WorkingHoursState extends State<WorkingHours> {
  final Map<String, List<TimeOfDay?>> workingHoursData = {
    "monday": [null, null],
    "tuesday": [null, null],
    "wednesday": [null, null],
    "thursday": [null, null],
    "friday": [null, null],
    "saturday": [null, null],
    "sunday": [null, null],
  };

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
              height: 5,
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
                  "WORKING HOURS",
                  style: TextStyle(
                      color: AppColors.appViolet,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: SizeConfig.screenWidth! * 0.65,
                child: Column(
                    children: List.generate(7, (index) {
                  final TimeOfDay? ot =
                      workingHoursData[workingHoursData.keys.toList()[index]]
                          ?[0];
                  final TimeOfDay? ct =
                      workingHoursData[workingHoursData.keys.toList()[index]]
                          ?[1];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageLoader.assetSvg(
                          "asset/images/working_hours_calender/${workingHoursData.keys.toList()[index]}.svg",
                          height: 90,
                          width: 90,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final timeSelected = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 9, minute: 0));
                                if (timeSelected != null) {
                                  setState(() {
                                    workingHoursData[workingHoursData.keys
                                        .toList()[index]]?[0] = timeSelected;
                                  });
                                }
                              },
                              child: Container(
                                width: SizeConfig.screenWidth! * 0.4,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.appViolet, width: 2)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ot != null
                                          ? DateFormat.jm().format(DateTime(
                                              2024, 1, 1, ot.hour, ot.minute))
                                          : "Opening Time",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    ImageLoader.assetSvg(ImagePath.arrowUpDown,
                                        width: 30),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            GestureDetector(
                              onTap: () async {
                                final timeSelected = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 9, minute: 0));
                                if (timeSelected != null) {
                                  setState(() {
                                    workingHoursData[workingHoursData.keys
                                        .toList()[index]]?[1] = timeSelected;
                                  });
                                }
                              },
                              child: Container(
                                width: SizeConfig.screenWidth! * 0.4,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.appViolet, width: 2)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      ct != null
                                          ? DateFormat.jm().format(DateTime(
                                              2024, 1, 1, ct.hour, ct.minute))
                                          : "Closing Time",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                      ),
                                    ),
                                    ImageLoader.assetSvg(ImagePath.arrowUpDown,
                                        width: 30),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }))),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: SizeConfig.screenHeight! * 0.055,
                width: SizeConfig.screenWidth! * 0.42,
                child: CustomButton(
                  text: "CONTINUE",
                  borderColor: AppColors.appBorderPurple,
                  textStyle: GoogleFonts.lateef(
                      fontWeight: FontWeight.w400, fontSize: 26),
                  onPressed: () {
                    if (mounted) {
                      Navigator.of(context).pushNamed(PageRoutes.availableSlots);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
