import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    }
    }
}