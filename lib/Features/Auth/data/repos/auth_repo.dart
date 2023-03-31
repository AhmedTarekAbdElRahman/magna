import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../Core/errors/failures.dart';
import '../model/user_model/user_model.dart';

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
}
