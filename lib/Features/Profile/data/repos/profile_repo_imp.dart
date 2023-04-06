import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/firebase/auth_service.dart';
import 'package:magna/Core/firebase/firestorage_service.dart';
import 'package:magna/Features/Profile/data/repos/profile_repo.dart';

import '../../../../Core/model/user_model/user_model.dart';
import '../../../../constant.dart';

class ProfileRepoImp implements ProfileRepo {
  final AuthService authService;
  final FireStorageService fireStorageService;

  ProfileRepoImp(this.authService, this.fireStorageService);

  @override
  Future<Either<Failure, void>> userSignOut() async {
    try {
      await authService.signOut();
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  // late UserModel userModel;
  // @override
  // Future<Either<Failure, UserModel>> getUser() async{
  //   try {
  //     fireStorageService.getUser().listen((event) {
  //       userModel=UserModel.fromJson(event.data() as Map<String,dynamic>);
  //     });
  //     return right(userModel);
  //   } catch (e) {
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

@override
Future<Either<Failure, UserModel>> getUser() async{
  late UserModel userModel;
  try{
    final result = await fireStorageService.getUser(uId: uId);
    userModel=UserModel.fromJson(result.data() as Map<String,dynamic>);
    print(result);
    print(userModel.name);
    return right(userModel);
  }catch(e){
    return left(ServerFailure(e.toString()));
  }
}

  @override
  Future<Either<Failure, void>> editUser({required UserModel userModel}) async {
    try {
      await fireStorageService.editUser(userModel: userModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

}
