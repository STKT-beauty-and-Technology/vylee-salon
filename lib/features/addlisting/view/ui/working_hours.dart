import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vylee_partner/common/common%20widgets/custom_button.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/utilities/string.dart';
import '../../../../common/common widgets/custom_appbar.dart';
import '../../../../core/load_image/image_loader.dart';
import '../../../../core/path/image_path.dart';
import '../../../../core/responsive/size_config.dart';
import '../../../../themes/app_colors.dart';

class WorkingHours extends StatefulWidget {
  const WorkingHours({super.key, this.isEdit});
  final bool? isEdit;

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
  bool allHoursProvided = false;

  checkIfAllHoursProvided() {
    for (var element in workingHoursData.values) {
      if (element.contains(null)) {
        allHoursProvided = false;
        return;
      }
    }
    allHoursProvided = true;
  }

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
                Text(
                  Constant.workingHours,
                  style: const TextStyle(
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
                width: SizeConfig.screenWidth! * 0.85,
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
                        // ImageLoader.assetSvg(
                        //   "asset/images/working_hours_calender/${workingHoursData.keys.toList()[index]}.svg",
                        //   height: 90,
                        //   width: 90,
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Open",
                              style: TextStyle(
                                  color: Color(0xff791DAE),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                            const SizedBox(height: 5),
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
                                    checkIfAllHoursProvided();
                                  });
                                }
                              },
                              child: Container(
                                width: SizeConfig.screenWidth! * 0.4,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: AppColors.appViolet, width: 2)),
                                child: Text(
                                  ot != null
                                      ? DateFormat.Hm().format(DateTime(
                                          2024, 1, 1, ot.hour, ot.minute))
                                      : Constant.hhMM,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Close",
                              style: TextStyle(
                                  color: Color(0xff791DAE),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                            const SizedBox(height: 5),
                            GestureDetector(
                              onTap: () async {
                                final timeSelected = await showTimePicker(
                                    context: context,
                                    initialTime:
                                        const TimeOfDay(hour: 17, minute: 0));
                                if (timeSelected != null) {
                                  setState(() {
                                    workingHoursData[workingHoursData.keys
                                        .toList()[index]]?[1] = timeSelected;
                                    checkIfAllHoursProvided();
                                  });
                                }
                              },
                              child: Container(
                                width: SizeConfig.screenWidth! * 0.4,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: AppColors.appViolet, width: 2)),
                                child: Text(
                                  ct != null
                                      ? DateFormat.Hm().format(DateTime(
                                          2024, 1, 1, ct.hour, ct.minute))
                                      : Constant.hhMM,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
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
                  text: widget.isEdit == true ? Constant.save : Constant.cont,
                  bgcolor: allHoursProvided ? null : AppColors.gray600,
                  borderColor: AppColors.appBorderPurple,
                  textStyle: GoogleFonts.lateef(
                      fontWeight: FontWeight.w400, fontSize: 26),
                  onPressed: allHoursProvided
                      ? () {
                          if (widget.isEdit != true) {
                            Navigator.of(context)
                                .pushNamed(PageRoutes.galleryPage);
                          } else {
                            Navigator.of(context).pop();
                          }
                        }
                      : () {
                          Fluttertoast.showToast(
                              msg: "Before proceeding, First fill all Hours");
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
