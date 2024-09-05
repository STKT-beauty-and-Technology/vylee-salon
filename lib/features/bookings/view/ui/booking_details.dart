import 'package:flutter/material.dart';
import 'package:vylee_partner/common/common%20widgets/custom_appbar.dart';
import 'package:vylee_partner/core/load_image/image_loader.dart';
import 'package:vylee_partner/core/path/image_path.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/bookings/view%20model/bookings_view_model.dart';
import 'package:vylee_partner/themes/app_colors.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key, required this.bookingId});
  final int bookingId;

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails>
    with BookingsViewModel {
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
                  "BOOKING ${widget.bookingId} DETAILS",
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
            SizedBox(
              width: SizeConfig.screenWidth! * 0.9,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TIME",
                            style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "12:00 HRS",
                            style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "TIME",
                            style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "12-08-24",
                            style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(
                    color: AppColors.gray600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CLIENT NAME",
                            style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "12:00 HRS",
                            style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 3),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "CLIENT ID",
                            style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "56789",
                            style: TextStyle(
                              color: AppColors.appViolet,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 25),
                        ],
                      ),
                      Spacer()
                    ],
                  ),
                  Divider(
                    color: AppColors.gray600,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "SERVICE",
                        style: TextStyle(
                          color: AppColors.appViolet,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "LOREM IPUSM DOLOR SET ITME",
                        style: TextStyle(
                          color: AppColors.appViolet,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                  Divider(
                    color: AppColors.gray600,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "COST",
                        style: TextStyle(
                          color: AppColors.appViolet,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "\$23.89",
                        style: TextStyle(
                          color: AppColors.appViolet,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
