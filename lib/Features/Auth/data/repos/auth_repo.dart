import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../Core/errors/failures.dart';
import '../../../../Core/model/user_model/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserCredential>> userSignIn({
    required UserModel userModel,
  });

  Future<Either<Failure, UserCredential>> userSignUp({
    required UserModel userModel,
  });

  Future<Either<Failure, void>> postUserData({
    required UserModel userModel,
  });

  Future<Either<Failure, bool>> getUserRole({required String uId});
}
