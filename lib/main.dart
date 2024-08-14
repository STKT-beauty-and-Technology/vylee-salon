import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'navigation/navigation.dart';
import 'navigation/page_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
    return OrientationBuilder(builder: (context, orientation) {
      return LayoutBuilder(builder: (context, constraints) {
        SizeConfig.init(constraints, orientation);
        return MaterialApp(
            // theme: TorbitoTheme.lightTheme,
            initialRoute: PageRoutes.splash,
            debugShowCheckedModeBanner: false,
            theme:
                ThemeData(fontFamily: GoogleFonts.frankRuhlLibre().fontFamily),
            onGenerateRoute: Navigation.onGenerateRoutes,
            color: Colors.white);
      });
    });
  }
}
