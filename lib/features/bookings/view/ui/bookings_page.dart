import 'package:flutter/material.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/bookings/view%20model/bookings_view_model.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({super.key, required this.date});
  final DateTime date;

  @override
  State<BookingsPage> createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> with BookingsViewModel {
  DateTime date = DateTime.now();
  final bookingsList = [1, 2, 3, 4];
  @override
  void initState() {
    super.initState();
    setState(() {
      date = widget.date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight,
        ),
        Container(
          height: SizeConfig.screenHeight! * 0.3,
          width: SizeConfig.screenWidth,
          decoration: const BoxDecoration(
              color: AppColors.appViolet,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60))),
        ),
        Positioned(
          left: 50,
          top: 100,
          child: Text(
            getDateString(date),
            style: const TextStyle(
                color: AppColors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
            right: 50,
            top: 80,
            child: IconButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    helpText: "Select Date to see sales details",
                    fieldLabelText: "Select Date to see sales details",
                    firstDate: DateTime.now().subtract(
                      const Duration(days: 100),
                    ),
                    lastDate: DateTime.now().add(
                      const Duration(days: 100),
                    ),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      date = selectedDate;
                    });
                  }
                },
                icon: const Icon(
                  Icons.calendar_month_rounded,
                  color: AppColors.white,
                ))),
        Positioned(
          top: SizeConfig.screenHeight! * 0.25,
          left: SizeConfig.screenWidth! * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.appGray, width: 2)),
                width: 135,
                height: 90,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Booked Hours",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    Text(
                      "9.5",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: AppColors.appViolet),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(PageRoutes.freeSlots,
                      arguments: {"date": date});
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.appGray, width: 2)),
                  width: 135,
                  height: 90,
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Free Hours",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          Text(
                            "3.5",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 30,
                                color: AppColors.appViolet),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_right_outlined,
                        color: AppColors.black,
                        size: 40,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: SizeConfig.screenHeight! * 0.4,
          left: SizeConfig.screenWidth! * 0.12,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(bookingsList.length, (index) {
                return Container(
                  width: SizeConfig.screenWidth! * 0.7,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(PageRoutes.bookingDetails,
                          arguments: {"bookingId": bookingsList[index]});
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.black,
                        padding: const EdgeInsets.all(10),
                        elevation: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Bookings will show here",
                          // "Booking ${bookingsList[index] < 10 ? "0" : ""}${bookingsList[index]}",
                          style: const TextStyle(
                            color: AppColors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              })),
        )
      ],
    );
  }
}
