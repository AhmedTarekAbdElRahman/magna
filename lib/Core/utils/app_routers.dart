import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magna/Core/api_service/api_service.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Core/utils/service_locator.dart';
import 'package:magna/Features/Auth/data/repos/auth_repo_imp.dart';
import 'package:magna/Features/Auth/presentation/view_models/change_password_cubit/change_password_cubit.dart';
import 'package:magna/Features/Auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:magna/Features/Auth/presentation/views/change_password_view.dart';
import 'package:magna/Features/Auth/presentation/views/login_view.dart';
import 'package:magna/Features/Auth/presentation/views/register_view.dart';
import 'package:magna/Features/D&N/Home/presentation/view_models/home_service_cubit/home_service_cubit.dart';
import 'package:magna/Features/D&N/Home/presentation/view_models/lab_note_cubit/lab_note_cubit.dart';
import 'package:magna/Features/D&N/Home/presentation/views/view_lab_result_view.dart';
import 'package:magna/Features/Patient/data/repos/patient_repo_imp.dart';
import 'package:magna/Features/Patient/presentation/view_models/upload_lab_result_cubit/upload_lab_result_cubit.dart';
import 'package:magna/Features/Patient/presentation/views/upload_lab_result_view.dart';
import '../../Features/Auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import '../../Features/D&N/Add/data/repos/add_repo_imp.dart';
import '../../Features/D&N/Add/presentation/view_models/add_patient_cubit/add_patient_cubit.dart';
import '../../Features/D&N/Add/presentation/views/add_patient_view.dart';
import '../../Features/D&N/Home/data/repos/home_repo_imp.dart';
import '../../Features/D&N/Home/presentation/view_models/delete_patient_cubit/delete_patient_cubit.dart';
import '../../Features/D&N/Home/presentation/view_models/edit_patient_cubit/edit_patient_cubit.dart';
import '../../Features/D&N/Home/presentation/view_models/get_patients_cubit/get_patients_cubit.dart';
import '../../Features/D&N/Home/presentation/views/patient_details_edit_view.dart';
import '../../Features/D&N/Home/presentation/views/patient_details_view.dart';
import '../../Features/D&N/Intro/presentation/views/onboarding_view.dart';
import '../../Features/D&N/Intro/presentation/views/splash_view.dart';
import '../../Features/D&N/Layout/presentation/views/doctor_layout_view.dart';
import '../../Features/D&N/Layout/presentation/views/nurse_layout_view.dart';
import '../../Features/D&N/Profile/data/repos/profile_repo_imp.dart';
import '../../Features/D&N/Profile/presentation/view_models/edit_profile_cubit/edit_profile_cubit.dart';
import '../../Features/D&N/Profile/presentation/view_models/get_user_cubit/get_user_cubit.dart';
import '../../Features/D&N/Profile/presentation/view_models/sign_out_cubit/sign_out_cubit.dart';
import '../../Features/D&N/Profile/presentation/views/profile_edit_view.dart';
import '../../Features/D&N/Search/data/repos/search_repo_imp.dart';
import '../../Features/D&N/Search/presentation/view_models/search_cubit/search_cubit.dart';
import '../../Features/D&N/Search/presentation/views/search_patient_details_view.dart';
import '../../Features/Patient/presentation/view_models/get_patient_profile_cubit/get_patient_profile_cubit.dart';
import '../../Features/Patient/presentation/views/patient_profile_view.dart';
import '../../constant.dart';

class Routes {
  static const String splashView = "/";
  static const String kOnboardingView = '/onboardingView';
  static const String kLoginView = '/loginView';
  static const String kRegisterView = '/registerView';
  static const String kNurseLayoutView = '/nurseLayoutView';
  static const String kDoctorLayoutView = '/doctorLayoutView';
  static const String kPatientDetailsView = '/patientDetailsView';
  static const String kSearchPatientDetailsView = '/searchPatientDetailsView';
  static const String kAddPatientView = '/addPatientView';
  static const String kUpdatePatientDetailsView = '/updatePatientDetailsView';
  static const String kProfileUpdateView = '/profileUpdateView';
  static const String kPatientProfileView = '/patientProfileView';
  static const String kChangePasswordView = '/changePasswordView';
  static const String kUploadLabResultView = '/uploadLabResultView';
  static const String kViewLabResultView = '/viewLabResultView';
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
                  BlocProvider(
                    create: (context) =>
                        GetPatientsCubit(getIt.get<HomeRepoImp>())
                          ..getNursePatients(),
                  ),
                ], child: const NurseLayoutView()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kDoctorLayoutView:
        return PageRouteBuilder(
            settings: RouteSettings(
              arguments: settings.arguments,
            ),
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
                  BlocProvider(
                    create: (context) =>
                        GetPatientsCubit(getIt.get<HomeRepoImp>())
                          ..getDoctorPatients(),
                  ),
                  BlocProvider(
                    create: (context) =>
                        DeletePatientCubit(getIt.get<HomeRepoImp>()),
                  )
                ], child: const DoctorLayoutView()),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kPatientDetailsView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          List<dynamic> arg = settings.arguments as List<dynamic>;
          return MultiBlocProvider(
              providers: [
                BlocProvider<GetPatientProfileCubit>.value(
                  value: (GetPatientProfileCubit(
                      getIt.get<PatientRepoImp>(), getIt.get<ApiService>())
                    ..getPatientProfile(pId: arg[0])),
                ),
                BlocProvider<HomeServiceCubit>(
                    create: (context) => HomeServiceCubit(
                          getIt.get<HomeRepoImp>(),
                        ))
              ],
              child: PatientDetailsView(
                patientModel: arg[1],
              ));
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return customTransition(animation, child);
        });
      case Routes.kSearchPatientDetailsView:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
          List<dynamic> arg = settings.arguments as List<dynamic>;
          return BlocProvider<SearchCubit>.value(
              value: arg[2] == 'n'
                  ? (SearchCubit(getIt.get<SearchRepoImp>())
                    ..nurseSearch(searchKey: arg[3]))
                  : (SearchCubit(getIt.get<SearchRepoImp>())
                    ..doctorSearch(searchKey: arg[3])),
              child: SearchPatientDetailsView(
                index: arg[0],
                patientModel: arg[1],
              ));
        }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return customTransition(animation, child);
        });
      case Routes.kAddPatientView:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return BlocProvider(
                create: (context) => AddPatientCubit(
                    getIt.get<AddRepoImp>(), getIt.get<AuthRepoImp>()),
                child: const AddPatientView());
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      case Routes.kUpdatePatientDetailsView:
        return PageRouteBuilder(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
            create: (context) => EditPatientCubit(getIt.get<HomeRepoImp>()),
            child: const PatientDetailsEditView(),
          ),
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
      case Routes.kPatientProfileView:
        return PageRouteBuilder(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          pageBuilder: (context, animation, secondaryAnimation) =>
              MultiBlocProvider(providers: [
            BlocProvider(
              create: (context) => GetPatientProfileCubit(
                  getIt.get<PatientRepoImp>(), getIt.get<ApiService>())
                ..getPatientProfile(pId: uId!),
            ),
            BlocProvider(
                create: (context) => SignOutCubit(getIt.get<ProfileRepoImp>())),
          ], child: const PatientProfileView()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      case Routes.kChangePasswordView:
        return PageRouteBuilder(
          settings: RouteSettings(
            arguments: settings.arguments,
          ),
          pageBuilder: (context, animation, secondaryAnimation) {
            String arg = settings.arguments as String;

            return BlocProvider(
                create: (context) =>
                    ChangePasswordCubit(getIt.get<AuthRepoImp>()),
                child: ChangePasswordView(
                  email: arg,
                ));
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return customTransition(animation, child);
          },
        );
      case Routes.kUploadLabResultView:
        return PageRouteBuilder(
            settings: RouteSettings(
              arguments: settings.arguments,
            ),
            pageBuilder: (context, animation, secondaryAnimation) {
              final patientModel = settings.arguments as PatientModel;
              return BlocProvider(
                  create: (context) => UploadLabResultCubit(
                      getIt.get<PatientRepoImp>(), getIt.get<ApiService>()),
                  child: UploadLabResultView(
                    patientModel: patientModel,
                  ));
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      case Routes.kViewLabResultView:
        return PageRouteBuilder(
            settings: RouteSettings(
              arguments: settings.arguments,
            ),
            pageBuilder: (context, animation, secondaryAnimation) {
              final patientModel = settings.arguments as PatientModel;
              return ViewLabResultView(patientModel: patientModel);
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return customTransition(animation, child);
            });
      default:
        return unDefinedRoute();
    }
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

FadeTransition customTransition(Animation<double> animation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
