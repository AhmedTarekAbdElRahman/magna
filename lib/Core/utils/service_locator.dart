import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:magna/Core/firebase/auth_service.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Core/firebase/notification_service.dart';
import 'package:magna/Core/firebase/storage_service.dart';
import 'package:magna/Features/Auth/data/repos/auth_repo_imp.dart';
import 'package:magna/Features/D&N/Profile/data/repos/profile_repo_imp.dart';

import '../../Features/D&N/Add/data/repos/add_repo_imp.dart';
import '../../Features/D&N/Home/data/repos/home_repo_imp.dart';
import '../../Features/D&N/Search/data/repos/search_repo_imp.dart';
import '../../Features/Patient/data/repos/patient_repo_imp.dart';
import '../api_service/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<NotificationService>(NotificationService());
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<FireStoreService>(FireStoreService());
  getIt.registerSingleton<StorageService>(StorageService());
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(
        BaseOptions(
          baseUrl: 'https://fcm.googleapis.com/fcm/',
          receiveDataWhenStatusError: true,
        ),
      ),
    ),
  );
  getIt.registerSingleton<AuthRepoImp>(
    AuthRepoImp(
      getIt.get<AuthService>(),
      getIt.get<FireStoreService>(),
      getIt.get<NotificationService>(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImp>(ProfileRepoImp(
    getIt.get<AuthService>(),
    getIt.get<FireStoreService>(),
    getIt.get<StorageService>(),
    getIt.get<NotificationService>(),
  ));
  getIt.registerSingleton<AddRepoImp>(AddRepoImp(
    getIt.get<FireStoreService>(),
    getIt.get<StorageService>(),
    getIt.get<ApiService>(),

  ));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(
    getIt.get<FireStoreService>(),
    getIt.get<StorageService>(),
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<SearchRepoImp>(SearchRepoImp(
    getIt.get<FireStoreService>(),
  ));
  getIt.registerSingleton<PatientRepoImp>(PatientRepoImp(
    getIt.get<FireStoreService>(),
    getIt.get<StorageService>(),
    getIt.get<ApiService>()
  ));

}
