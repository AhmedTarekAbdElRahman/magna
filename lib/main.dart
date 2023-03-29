import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:magna/Core/utils/service_locator.dart';
import 'package:magna/Core/utils/shared_preferences.dart';
import 'package:magna/constant.dart';
import 'Core/utils/app_routers.dart';
import 'Core/utils/observer_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();
  setupServiceLocator();

// Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(Magna(
    appRouter: AppRouter(),
  ));
}

class Magna extends StatelessWidget {
  final AppRouter appRouter;

  const Magna({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: appRouter.generateRoute,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: kPrimaryColor),
            primaryColor: kPrimaryColor,
            textTheme: GoogleFonts.arimaMaduraiTextTheme(),
          ),
        );
      },
    );
  }
}
