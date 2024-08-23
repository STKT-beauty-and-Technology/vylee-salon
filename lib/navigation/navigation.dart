import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vylee_partner/features/addlisting/view/ui/add_address.dart';
import 'package:vylee_partner/features/addlisting/view/ui/available_slots.dart';
import 'package:vylee_partner/features/addlisting/view/ui/service_categories/female_custom_service.dart';
import 'package:vylee_partner/features/addlisting/view/ui/service_categories/female_service_category.dart';
import 'package:vylee_partner/features/addlisting/view/ui/gallery_page.dart';
import 'package:vylee_partner/features/addlisting/view/ui/salon_information.dart';
import 'package:vylee_partner/features/addlisting/view/ui/upload_document.dart';
import 'package:vylee_partner/features/addlisting/view/ui/service_categories/service_category.dart';
import 'package:vylee_partner/features/addlisting/view/ui/upload_documents.dart';
import 'package:vylee_partner/features/addlisting/view/ui/welcome_screen.dart';
import 'package:vylee_partner/features/addlisting/view/ui/working_hours.dart';
import 'package:vylee_partner/features/login/view/ui/login_screen.dart';
import 'package:vylee_partner/features/login/view/ui/otp_screen.dart';
import 'package:vylee_partner/features/register/view/ui/register_screen.dart';
import 'package:vylee_partner/features/started/get_start_screen.dart';
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
                  name: (arguments as Map<String, dynamic>)["name"],
                ));
      case PageRoutes.addAddress:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const AddAddressScreen());
      case PageRoutes.salonInformation:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const SalonInformation());
      case PageRoutes.workingHours:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const WorkingHours());
      case PageRoutes.galleryPage:
        return MaterialPageRoute(
            settings: routeSettings, builder: (context) => const GalleryPage());
      case PageRoutes.serviceCategories:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const ServiceCategory());
      case PageRoutes.femaleCategory:
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => const FemaleServiceCategory());
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
            builder: (context) => const AvailableSlots());
    }
    return null;
    }
}