import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/utils/service_locator.dart';
import 'package:magna/Features/Auth/data/repos/auth_repo_imp.dart';
import 'package:magna/Features/Auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:magna/Features/Auth/presentation/views/login_view.dart';
import 'package:magna/Features/Auth/presentation/views/register_view.dart';
import 'package:magna/Features/Home/presentation/views/patient_details_view.dart';
import 'package:magna/Features/Intro/presentation/views/onboarding_view.dart';
import 'package:magna/Features/Intro/presentation/views/splash_view.dart';
import 'package:magna/Features/Profile/presentation/views/profile_view.dart';
import 'package:magna/Features/Update/presentation/views/update_patient_details_view.dart';
import '../../Features/Add/presentation/views/add_patient_view.dart';
import '../../Features/Auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import '../../Features/Home/presentation/views/home_view.dart';
import '../../Features/Profile/data/repos/profile_repo_imp.dart';
import '../../Features/Profile/presentation/view_models/sign_out_cubit/sign_out_cubit.dart';
import '../../Features/Update/presentation/views/profile_update_view.dart';

class Routes {
  static const String splashView = "/";
  static const String kOnboardingView = '/onboardingView';
  static const String kLoginView = '/loginView';
  static const String kRegisterView = '/registerView';
  static const String kHomeView = '/homeView';
  static const String kPatientDetailsView = '/patientDetailsView';
  static const String kAddPatientView = '/addPatientView';
  static const String kUpdatePatientDetailsView = '/updatePatientDetailsView';
  static const String kProfileView = '/profileView';
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
      case Routes.kHomeView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kPatientDetailsView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const PatientDetailsView(),
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
              const UpdatePatientDetailsView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      case Routes.kProfileView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => SignOutCubit(
              getIt.get<ProfileRepoImp>(),
            ),
            child: const ProfileView(),
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      case Routes.kProfileUpdateView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ProfileUpdateView(),
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
            ));
  }
}
