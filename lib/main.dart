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
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      print('user SignOut');
      CacheHelper.saveData(key: 'route',value: Routes.kLoginView);
      route = CacheHelper.getData(key: 'route');
      uId = '';
    } else {
      print('user SignIn');
      uId = user.uid;
      route = CacheHelper.getData(key: 'route');
    }
  });
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
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            onGenerateRoute: appRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              textTheme: GoogleFonts.arimaMaduraiTextTheme(),
            ),
          ),
        );
      },
    );
  }
}
