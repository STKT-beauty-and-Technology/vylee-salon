import 'package:flutter/material.dart';
import 'navigation/navigation.dart';
import 'navigation/page_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      const MaterialApp(
        // theme: TorbitoTheme.lightTheme,
          initialRoute: PageRoutes.getStarted,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Navigation.onGenerateRoutes,
          color: Colors.white);
  }
}


