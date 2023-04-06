import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failures.dart';
import '../../../../Core/model/user_model/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> userSignOut();
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, void>> editUser({required UserModel userModel});

// Future<Either<Failure, UserModel>> getUser();


}
