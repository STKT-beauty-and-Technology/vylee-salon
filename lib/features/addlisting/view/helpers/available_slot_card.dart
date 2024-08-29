import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class AvailableSlotCard extends StatefulWidget {
  const AvailableSlotCard({
    super.key,
    required this.onAddPressed,
    required this.day,
    required this.isAdded,
  });

  final Function onAddPressed;
  final String day;
  final bool isAdded;

  @override
  State<AvailableSlotCard> createState() => _AvailableSlotCardState();
}

class _AvailableSlotCardState extends State<AvailableSlotCard> {
  TimeOfDay? begin;

  TimeOfDay? end;
  int numberOfSlots = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: AppColors.grayf5,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(5),
            width: double.infinity,
            child: Text(
              widget.day,
              style: GoogleFonts.inter(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ),
          const SizedBox(height: 15),
          Visibility(
              visible: !widget.isAdded,
              replacement: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      "${DateFormat.jm().format(DateTime(2024, 1, 1, begin?.hour ?? 0, begin?.minute ?? 0))}-${DateFormat.jm().format(DateTime(2024, 1, 1, end?.hour ?? 0, end?.minute ?? 0))}"),
                  Container(
                    width: 90,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: AppColors.gray600,
                    ),
                    child: Builder(builder: (context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (numberOfSlots > 1) {
                                  numberOfSlots--;
                                }
                              });
                            },
                            child: const SizedBox(
                              width: 20,
                              height: 20,
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                fill: 1,
                              ),
                            ),
                          ),
                          const VerticalDivider(),
                          Text(numberOfSlots.toString()),
                          const VerticalDivider(),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  numberOfSlots++;
                                });
                              },
                              child: const SizedBox(
                                width: 20,
                                height: 20,
                                child: Icon(
                                  Icons.add,
                                  fill: 1,
                                  size: 15,
                                ),
                              )),
                        ],
                      );
                    }),
                  )
                ],
              ),
              child: Column(
                children: [
                  Container(
                    color: const Color(0xFFFEF8FF),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5),
                    width: double.infinity,
                    child: Text(
                      "No Slots Added",
                      style: GoogleFonts.inter(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 15),
                  DefaultTextStyle(
                    style: GoogleFonts.inter(color: AppColors.white),
                    child: Container(
                        color: const Color(0xFFF6EAF9),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5),
                        width: double.infinity,
                        child: SizedBox(
                          width: SizeConfig.screenWidth! * 0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  begin = await showTimePicker(
                                      context: context,
                                      initialTime:
                                          const TimeOfDay(hour: 9, minute: 00));
                                  setState(() {});
                                },
                                child: Container(
                                  width: 70,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.appViolet,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(begin != null
                                      ? DateFormat.Hm().format(DateTime(
                                          2024,
                                          1,
                                          1,
                                          begin?.hour ?? 0,
                                          begin?.minute ?? 0))
                                      : "--:--"),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.appViolet,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text("AM"),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  end = await showTimePicker(
                                      context: context,
                                      initialTime: const TimeOfDay(
                                          hour: 15, minute: 00));
                                  setState(() {});
                                },
                                child: Container(
                                  width: 70,
                                  height: 25,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.appViolet,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(end != null
                                      ? DateFormat.Hm().format(DateTime(2024, 1,
                                          1, end?.hour ?? 0, end?.minute ?? 0))
                                      : "--:--"),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.appViolet,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Text("PM"),
                              ),
                              SizedBox(
                                width: 40,
                                height: 20,
                                child: ElevatedButton(
                                    onPressed: () {
                                      widget.onAddPressed(begin, end);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.white,
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5))),
                                    child: Text(
                                      "Add",
                                      style: GoogleFonts.inter(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              )
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(height: 15),
                ],
              )),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
