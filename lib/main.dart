import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:magna/Core/utils/functions/custom_toast.dart';
import 'package:magna/Core/utils/service_locator.dart';
import 'package:magna/Core/utils/shared_preferences.dart';
import 'package:magna/Features/D&N/Home/presentation/view_models/lab_note_cubit/lab_note_cubit.dart';
import 'package:magna/constant.dart';
import 'Core/utils/app_routers.dart';
import 'Core/utils/observer_services.dart';
import 'Features/D&N/Home/data/repos/home_repo_imp.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {


  print("Handling a background message: ${message.messageId}");
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      showToast(text: '${message.notification!.title!} ${message.notification!.body!.toLowerCase()}', state: ToastStates.warning);
    }
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await CacheHelper.init();

  setupServiceLocator();
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user == null) {
      print('user SignOut');
      CacheHelper.saveData(key: 'route',value: Routes.kLoginView);
      route = CacheHelper.getData(key: 'route');
      uId = '';
      role='';
      doctorName='';
    } else {
      print('user SignIn'+user.uid);
      uId = CacheHelper.getData(key: 'token');
      doctorName=CacheHelper.getData(key: 'doctorName');
      role=CacheHelper.getData(key: 'role');
      print(uId);
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
          child: BlocProvider(
            create: (context) => LabNoteCubit(getIt.get<HomeRepoImp>()),
            child: MaterialApp(
              onGenerateRoute: appRouter.generateRoute,
              debugShowCheckedModeBanner: false,
              // theme: ThemeData.light().copyWith(
              //   textTheme: GoogleFonts.arimaMaduraiTextTheme(),
              // ),
            ),
          ),
        );
      },
    );
  }
}
