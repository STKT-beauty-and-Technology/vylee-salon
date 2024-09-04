import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vylee_partner/features/about/view/about_vylee.dart';
import 'package:vylee_partner/features/addlisting/view/ui/account_information.dart';
import 'package:vylee_partner/features/addlisting/view/ui/add_address.dart';
import 'package:vylee_partner/features/addlisting/view/ui/add_bank_account.dart';
import 'package:vylee_partner/features/addlisting/view/ui/all_services.dart';
import 'package:vylee_partner/features/addlisting/view/ui/available_slots.dart';
import 'package:vylee_partner/features/addlisting/view/ui/bank_accounts.dart';
import 'package:vylee_partner/features/addlisting/view/ui/edit_profile.dart';
import 'package:vylee_partner/features/addlisting/view/ui/service_categories/female_custom_service.dart';
import 'package:vylee_partner/features/addlisting/view/ui/service_categories/female_service_category.dart';
import 'package:vylee_partner/features/addlisting/view/ui/gallery_page.dart';
import 'package:vylee_partner/features/addlisting/view/ui/salon_information.dart';
import 'package:vylee_partner/features/addlisting/view/ui/transactions.dart';
import 'package:vylee_partner/features/addlisting/view/ui/upload_document.dart';
import 'package:vylee_partner/features/addlisting/view/ui/service_categories/service_category.dart';
import 'package:vylee_partner/features/addlisting/view/ui/upload_documents.dart';
import 'package:vylee_partner/features/addlisting/view/ui/welcome_screen.dart';
import 'package:vylee_partner/features/addlisting/view/ui/working_hours.dart';
import 'package:vylee_partner/features/helpandsupport/view/help_and_support.dart';
import 'package:vylee_partner/features/login/view/ui/login_screen.dart';
import 'package:vylee_partner/features/login/view/ui/otp_screen.dart';
import 'package:vylee_partner/features/register/view/ui/register_screen.dart';
import 'package:vylee_partner/features/started/get_start_screen.dart';
import 'package:vylee_partner/features/terms/view/terms_and_conditions.dart';
import 'package:vylee_partner/navigation/page_routes.dart';

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
            settings: routeSettings,
            builder: (context) => const LoginScreen());
      case PageRoutes.otpScreen:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => OtpScreen(
                mobileNumber:
                    (arguments as Map<String, dynamic>)["mobileNumber"]));
      case PageRoutes.registrationScreen:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const RegisterScreen());
      case PageRoutes.welcomeScreen:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => WelcomeScreen(
                  name: (arguments as Map<String, dynamic>?)?["name"],
                ));
      case PageRoutes.addAddress:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => AddAddressScreen(
                  isEdit: (arguments as Map<String, dynamic>?)?["edit"],
                ));
      case PageRoutes.salonInformation:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => SalonInformation(
                  isEdit: (arguments as Map<String, dynamic>?)?["edit"],
                ));
      case PageRoutes.workingHours:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => WorkingHours(
                  isEdit: (arguments as Map<String, dynamic>?)?["edit"],
                ));
      case PageRoutes.galleryPage:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => GalleryPage(
                  isEdit: (arguments as Map<String, dynamic>?)?["edit"],
                ));
      case PageRoutes.serviceCategories:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => ServiceCategory(
                  isEdit: (arguments as Map<String, dynamic>?)?["edit"],
                ));
      case PageRoutes.femaleCategory:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => FemaleServiceCategory(
                  gender: (arguments as Map<String, dynamic>)["gender"],
                ));
      case PageRoutes.maleCategory:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const ServiceCategory());
      case PageRoutes.othersCategory:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const ServiceCategory());
      case PageRoutes.femaleCustomService:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const FemaleCustomService());
      case PageRoutes.uploadDocuments:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const UploadDocuments());
      case PageRoutes.availableSlots:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => AvailableSlots(
                  isEdit: (arguments as Map<String, dynamic>?)?["edit"],
                ));
      case PageRoutes.accountInformation:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const AccountInformation());
      case PageRoutes.allServices:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const AllServices());
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
            settings: routeSettings,
            builder: (context) => const AboutVylee());
      case PageRoutes.termsConditions:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const TermsAndConditions());
      case PageRoutes.helpAndSupport:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const HelpAndSupport());
    }
    return null;
    }
}