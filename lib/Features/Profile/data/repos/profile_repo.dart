import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failures.dart';

abstract class ProfileRepo {
  Future<Either<Failure, void>> userSignOut();
}
