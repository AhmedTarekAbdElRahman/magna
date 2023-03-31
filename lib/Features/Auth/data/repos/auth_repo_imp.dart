import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:magna/Core/firebase/auth_service.dart';
import 'package:magna/Core/firebase/firestorage_service.dart';
import 'package:magna/Features/Auth/data/model/user_model/user_model.dart';
import 'package:magna/Features/Auth/data/repos/auth_repo.dart';

import '../../../../Core/errors/failures.dart';

class AuthRepoImp implements AuthRepo {
  final AuthService authService;
  final FireStorageService fireStorageService;

  AuthRepoImp(this.authService, this.fireStorageService);

  @override
  Future<Either<Failure, UserCredential>> userSignIn(
      {required UserModel userModel}) async {
    try {
      final result = await authService.signIn(
        userModel: userModel,
      );
      return Right(result);
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
      if (e is FirebaseAuthException) {
        return left(ServerFailure.fromFirebase(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> postUserData({required UserModel userModel}) async{
    try{
      final result =await fireStorageService.addUser(userModel: userModel);
      return right(result);
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}
