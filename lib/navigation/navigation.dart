import 'package:flutter/material.dart';
import 'package:vylee_partner/features/about/view/about_vylee.dart';
import 'package:vylee_partner/features/banking/view/ui/add_bank_account.dart';
import 'package:vylee_partner/features/banking/view/ui/bank_accounts.dart';
import 'package:vylee_partner/features/banking/view/ui/transactions.dart';
import 'package:vylee_partner/features/bookings/view/ui/booking_details.dart';
import 'package:vylee_partner/features/bookings/view/ui/free_slots.dart';
import 'package:vylee_partner/features/helpandsupport/view/help_and_support.dart';
import 'package:vylee_partner/features/home/view/ui/home_page.dart';
import 'package:vylee_partner/features/login/view/ui/login_screen.dart';
import 'package:vylee_partner/features/login/view/ui/otp_screen.dart';
import 'package:vylee_partner/features/profile/view/ui/account_information.dart';
import 'package:vylee_partner/features/profile/view/ui/available_slots.dart';
import 'package:vylee_partner/features/profile/view/ui/edit_profile.dart';
import 'package:vylee_partner/features/register/view/ui/register_screen.dart';
import 'package:vylee_partner/features/salon_details/view/ui/add_address.dart';
import 'package:vylee_partner/features/salon_details/view/ui/gallery_page.dart';
import 'package:vylee_partner/features/salon_details/view/ui/salon_information.dart';
import 'package:vylee_partner/features/salon_details/view/ui/success_screen.dart';
import 'package:vylee_partner/features/salon_details/view/ui/upload_documents.dart';
import 'package:vylee_partner/features/salon_details/view/ui/working_hours.dart';
import 'package:vylee_partner/features/salon_services/view/ui/service_categories/service_category.dart';
import 'package:vylee_partner/features/started/get_start_2.dart';
import 'package:vylee_partner/features/started/get_start_3.dart';
import 'package:vylee_partner/features/started/get_start_screen.dart';
import 'package:vylee_partner/features/terms/view/terms_and_conditions.dart';
import 'package:vylee_partner/navigation/page_routes.dart';
import 'package:vylee_partner/utilities/string.dart';

import '../features/splash/view/ui/splash_screen.dart';

class Navigation {
  static Route<dynamic>? onGenerateRoutes(RouteSettings routeSettings) {
    final arguments = routeSettings.arguments;
    switch (routeSettings.name) {
      case PageRoutes.splash:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const SplashScreen());
      case PageRoutes.getStarted:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const GetStarted());
      case PageRoutes.login:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const LoginScreen());
      case PageRoutes.otpScreen:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => OtpScreen(
                mobileNumber: (arguments
                    as Map<String, dynamic>)[Constant.mobileNumber]));
      case PageRoutes.registrationScreen:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => RegisterScreen(
                userName:
                    (arguments as Map<String, dynamic>)[Constant.userName]));
      case PageRoutes.homeScreen:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => HomePage(
                  name: (arguments as Map<String, dynamic>?)?[Constant.name],
                ));
      case PageRoutes.freeSlots:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => FreeSlots(
                  date: (arguments as Map<String, dynamic>?)?[Constant.date],
                ));
      case PageRoutes.bookingDetails:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => BookingDetails(
                  bookingId:
                      (arguments as Map<String, dynamic>?)?[Constant.bookingId],
                ));
      case PageRoutes.addAddress:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => AddAddressScreen(
                  isEdit: (arguments as Map<String, dynamic>?)?[Constant.edit],
                ));
      case PageRoutes.salonInformation:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => SalonInformation(
                  isEdit: (arguments as Map<String, dynamic>?)?[Constant.edit],
                ));
      case PageRoutes.workingHours:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => WorkingHours(
                  isEdit: (arguments as Map<String, dynamic>?)?[Constant.edit],
                ));
      case PageRoutes.galleryPage:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => GalleryPage(
                  isEdit: (arguments as Map<String, dynamic>?)?[Constant.edit],
                ));
      case PageRoutes.serviceCategories:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => ServiceCategory(
                  isEdit: (arguments as Map<String, dynamic>?)?[Constant.edit],
                ));
      // case PageRoutes.services:
      //   return MaterialPageRoute(
      //       settings: routeSettings,
      //       builder: (context) => ServicesPage(
      //             gender: (arguments as Map<String, dynamic>)[Constant.gender],
      //           ));

      case PageRoutes.uploadDocuments:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const UploadDocuments());
      case PageRoutes.availableSlots:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => AvailableSlots(
                  isEdit: (arguments as Map<String, dynamic>?)?[Constant.edit],
                ));
      case PageRoutes.accountInformation:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const AccountInformation());

      case PageRoutes.bankAccounts:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const BankAccounts());
      case PageRoutes.addBankAccount:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const AddBankAccount());
      case PageRoutes.transactions:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const Transactions());
      case PageRoutes.editProfile:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const EditProfile());
      case PageRoutes.aboutUs:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const AboutVylee());
      case PageRoutes.termsConditions:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const TermsAndConditions());
      case PageRoutes.helpAndSupport:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const HelpAndSupport());
      case PageRoutes.getStart2:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const GetStarted2());
      case PageRoutes.getStart3:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const GetStarted3());
      case PageRoutes.successScreen:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const SuccessScreen());
    }
    return null;
  }
}
