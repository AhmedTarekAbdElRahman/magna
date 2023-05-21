import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:magna/Core/firebase/auth_service.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Features/Auth/data/repos/auth_repo.dart';
import 'package:magna/constant.dart';
import '../../../../Core/errors/failures.dart';
import '../../../../Core/firebase/notification_service.dart';
import '../../../../Core/model/user_model/user_model.dart';
import '../../../../Core/utils/shared_preferences.dart';

class AuthRepoImp implements AuthRepo {
  final AuthService authService;
  final FireStoreService fireStorageService;
  final NotificationService notificationService;

  AuthRepoImp(this.authService, this.fireStorageService, this.notificationService);

  @override
  Future<Either<Failure, UserCredential>> userSignIn(
      {required UserModel userModel}) async {
    try {
      final result = await authService.signIn(
        userModel: userModel,
      );
      CacheHelper.saveData(key: 'token',value:result.user!.uid);
      uId = CacheHelper.getData(key: 'token');
      return right(result);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebase(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> userSignUp(
      {required UserModel userModel}) async {
    try {
      final result = await authService.signUp(
        userModel: userModel,
      );
      return Right(result);
    } catch (e) {
      print(e.toString());
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebase(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> postUserData(
      {required UserModel userModel}) async {
    try {
      final result = await fireStorageService.setDoc(
          model: userModel.toMap(),
          collectionReference: users,
          uId: userModel.uId!);
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> postUserRole(
      {required UserModel userModel}) async {
    try {
      final result = await fireStorageService.setDoc(
          model: {'role': userModel.role},
          collectionReference: roles,
          uId: userModel.uId!);
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getUserRole({required String uId}) async {
    try {
      final result = await fireStorageService
          .getDoc(uId: uId, collectionReference: roles)
          .then((value) async{
        if (value.get('role') == 'Doctor') {
          CacheHelper.saveData(key: 'role',value:'D');
          role = CacheHelper.getData(key: 'role');
          await fireStorageService.getDoc(uId: uId, collectionReference: users).then((value) {
            CacheHelper.saveData(key: 'doctorName',value:value.get('name'));
            doctorName = CacheHelper.getData(key: 'doctorName');
          });
          notificationService.subscribe(topic: uId);
          return 'D';
        }else if (value.get('role') == 'Nurse'){
          CacheHelper.saveData(key: 'role',value:'N');
          role = CacheHelper.getData(key: 'role');
          notificationService.subscribe(topic: 'N');
          return 'N';
        }else if (value.get('role') == 'Patient'){
          CacheHelper.saveData(key: 'role',value:'P');
          role = CacheHelper.getData(key: 'role');
          notificationService.subscribe(topic: uId);
          return'P';
        }else{
          return'Ops, you have to register first';
        }
      });
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final result = await authService.changePassword(
        email: email,
        newPassword: newPassword,
        oldPassword: oldPassword,
      );
      return Right(result);
    } catch (e) {
      print(e.toString());
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebase(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
