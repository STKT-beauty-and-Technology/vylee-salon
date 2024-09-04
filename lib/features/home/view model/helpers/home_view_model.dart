import 'package:flutter/material.dart';
import 'package:vylee_partner/features/addlisting/view/ui/welcome_screen.dart';
import 'package:vylee_partner/features/bookings/view/ui/bookings_page.dart';

mixin HomeViewModel {
  Widget getFirstScreen(String? name, Function welcomeAddOnPressed) {
    bool onBoardingCompleted = false;
    //logic to check if the user has filled mandatory details in profile

    // ignore: dead_code
    if (onBoardingCompleted) {
      return const BookingsPage();
    }

    if (name != null) {
      return WelcomeScreen(
        name: name,
        addOnPressed: welcomeAddOnPressed,
      );
    }

    //fetch Salon name from user profile
    return WelcomeScreen(
      name: "Fetched Name",
      addOnPressed: welcomeAddOnPressed,
    );
  }
}
