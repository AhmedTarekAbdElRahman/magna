import 'package:get_it/get_it.dart';
import 'package:magna/Core/firebase/auth_service.dart';
import 'package:magna/Features/Profile/data/repos/profile_repo_imp.dart';

import '../../Features/Auth/data/repos/auth_repo_imp.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp(getIt.get<AuthService>()));
  getIt.registerSingleton<ProfileRepoImp>(ProfileRepoImp(getIt.get<AuthService>()));

}