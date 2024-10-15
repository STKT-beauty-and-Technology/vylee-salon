import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vylee_partner/core/responsive/size_config.dart';
import 'package:vylee_partner/features/banking/view_model/get_bankdetails_cubit.dart';
import 'package:vylee_partner/features/login/view_model/cubits/otp_cubit.dart';
import 'package:vylee_partner/features/salon_details/view_model/cubits/gallery_cubit.dart';
import 'package:vylee_partner/features/salon_services/view_model/cubits/delete_category_cubit.dart';
import 'package:vylee_partner/features/salon_services/view_model/cubits/service_category_cubit.dart';

import 'navigation/navigation.dart';
import 'navigation/page_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
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
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => GalleryCubit(),
              ),
              BlocProvider(
                create: (context) => OtpCubit(),
              ),
              BlocProvider(
                create: (context) => ServiceCategoryCubit(),
              ),
              BlocProvider(
                create: (context) => GetBankdetailsCubit(),
              ),
              BlocProvider(
                create: (context) => DeleteCategoryCubit(),
              ),
            ],
            child: MaterialApp(
                // theme: TorbitoTheme.lightTheme,
                initialRoute: PageRoutes.getStarted,
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    fontFamily: GoogleFonts.frankRuhlLibre().fontFamily),
                onGenerateRoute: Navigation.onGenerateRoutes,
                color: Colors.white),
          );
        });
      });
    });
  }
}
