import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/utils/service_locator.dart';
import 'package:magna/Features/Auth/data/repos/auth_repo_imp.dart';
import 'package:magna/Features/Auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:magna/Features/Auth/presentation/views/login_view.dart';
import 'package:magna/Features/Auth/presentation/views/register_view.dart';
import 'package:magna/Features/Edit/presentation/views/patient_details_edit_view.dart';
import 'package:magna/Features/Profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:magna/Features/Profile/presentation/views/profile_edit_view.dart';
import 'package:magna/Features/Home/presentation/views/doctor_patient_details_view.dart';
import 'package:magna/Features/Intro/presentation/views/onboarding_view.dart';
import 'package:magna/Features/Intro/presentation/views/splash_view.dart';
import 'package:magna/Features/Layout/presentation/views/doctor_layout_view.dart';
import 'package:magna/Features/Layout/presentation/views/nurse_layout_view.dart';
import '../../Features/Add/presentation/views/add_patient_view.dart';
import '../../Features/Auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import '../../Features/Home/presentation/views/nurse_patient_details_view.dart';
import '../../Features/Profile/data/repos/profile_repo_imp.dart';
import '../../Features/Profile/presentation/view_models/get_user_cubit/get_user_cubit.dart';
import '../../Features/Profile/presentation/view_models/sign_out_cubit/sign_out_cubit.dart';

class Routes {
  static const String splashView = "/";
  static const String kOnboardingView = '/onboardingView';
  static const String kLoginView = '/loginView';
  static const String kRegisterView = '/registerView';
  static const String kNurseLayoutView = '/nurseLayoutView';
  static const String kDoctorLayoutView = '/doctorLayoutView';
  static const String kDoctorPatientDetailsView = '/doctorPatientDetailsView';
  static const String kNursePatientDetailsView = '/nursePatientDetailsView';
  static const String kAddPatientView = '/addPatientView';
  static const String kUpdatePatientDetailsView = '/updatePatientDetailsView';
  static const String kProfileUpdateView = '/profileUpdateView';
}

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.kOnboardingView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const OnBoardingView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kLoginView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                    create: (context) => SignInCubit(getIt.get<AuthRepoImp>()),
                    child: const LoginView()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kRegisterView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => SignUpCubit(getIt.get<AuthRepoImp>()),
            child: const RegisterView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      case Routes.kNurseLayoutView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => SignOutCubit(
                      getIt.get<ProfileRepoImp>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => GetUserCubit(
                      getIt.get<ProfileRepoImp>(),
                    )..getUser(),
                  ),
                ], child: const NurseLayoutView()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kDoctorLayoutView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => SignOutCubit(
                      getIt.get<ProfileRepoImp>(),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => GetUserCubit(
                      getIt.get<ProfileRepoImp>(),
                    )..getUser(),
                  ),
                ], child: const DoctorLayoutView()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kDoctorPatientDetailsView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const DoctorPatientDetailsView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kNursePatientDetailsView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const NursePatientDetailsView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kAddPatientView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const AddPatientView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      case Routes.kUpdatePatientDetailsView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const PatientDetailsEditView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      case Routes.kProfileUpdateView:
        return PageRouteBuilder(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
              create: (context) =>
                  EditProfileCubit(getIt.get<ProfileRepoImp>()),
              child: const ProfileEditView()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      default:
        return unDefinedRoute();
    }
  }

  FadeTransition customTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('noRouteFound'),
        ),
        body: const Center(
          child: Text('noRouteFound'),
        ),
      ),
    );
  }
}
