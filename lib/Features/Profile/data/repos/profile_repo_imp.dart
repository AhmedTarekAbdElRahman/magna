import 'package:dartz/dartz.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/firebase/auth_service.dart';
import 'package:magna/Features/Profile/data/repos/profile_repo.dart';


class ProfileRepoImp implements ProfileRepo {
  final AuthService authService;

  ProfileRepoImp(this.authService);

  @override
  Future<Either<Failure, void>> userSignOut()  async {
    try{
       await authService.signOut();
       return right(null);
    }catch(e){
        return left(ServerFailure(e.toString()));
    }
  }



}
