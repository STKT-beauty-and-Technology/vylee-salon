import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    }
    return null;
    }
}