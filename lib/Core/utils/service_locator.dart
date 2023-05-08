import 'package:get_it/get_it.dart';
import 'package:magna/Core/firebase/auth_service.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Core/firebase/storage_service.dart';
import 'package:magna/Features/Profile/data/repos/profile_repo_imp.dart';
import 'package:magna/Features/Search/data/repos/search_repo_imp.dart';

import '../../Features/Add/data/repos/add_repo_imp.dart';
import '../../Features/Auth/data/repos/auth_repo_imp.dart';
import '../../Features/Home/data/repos/home_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<FireStoreService>(FireStoreService());
  getIt.registerSingleton<StorageService>(StorageService());
  getIt.registerSingleton<AuthRepoImp>(
    AuthRepoImp(
      getIt.get<AuthService>(),
      getIt.get<FireStoreService>(),
    ),
  );
  getIt.registerSingleton<ProfileRepoImp>(ProfileRepoImp(
    getIt.get<AuthService>(),
    getIt.get<FireStoreService>(),
    getIt.get<StorageService>(),
  ));
  getIt.registerSingleton<AddRepoImp>(AddRepoImp(
    getIt.get<FireStoreService>(),
    getIt.get<StorageService>(),
  ));
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp(
    getIt.get<FireStoreService>(),
    getIt.get<StorageService>(),
  ));
  getIt.registerSingleton<SearchRepoImp>(SearchRepoImp(
    getIt.get<FireStoreService>(),
  ));

}
