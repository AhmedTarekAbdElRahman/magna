import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/firebase/auth_service.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Core/firebase/storage_service.dart';
import 'package:magna/Features/D&N/Profile/data/repos/profile_repo.dart';

import '../../../../../Core/firebase/notification_service.dart';
import '../../../../../Core/model/user_model/user_model.dart';
import '../../../../../constant.dart';

class ProfileRepoImp implements ProfileRepo {
  final AuthService authService;
  final FireStoreService fireStorageService;
  final StorageService storageService;
  final NotificationService notificationService;

  ProfileRepoImp(this.authService, this.fireStorageService, this.storageService,
      this.notificationService);

  @override
  Future<Either<Failure, void>> userSignOut() async {
    try {
      notificationService.unsubscribe(topic: uId!);
      notificationService.unsubscribe(topic:'N');
      await authService.signOut();
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    late UserModel userModel;
    try {
      final result = await fireStorageService.getDoc(
          uId: uId!, collectionReference: users);
      userModel = UserModel.fromJson(result.data() as Map<String, dynamic>);

      return right(userModel);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editUser({required UserModel userModel}) async {
    try {
      await fireStorageService.editDoc(
          model: userModel.editMap(),
          collectionReference: users,
          id: userModel.uId!);
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  String? imageUrl;

  @override
  Future<Either<Failure, String>> uploadImage(
      {required File profileImage}) async {
    try {
      await storageService.uploadImage(image: profileImage).then((value) async {
        await value.ref.getDownloadURL().then((value) {
          imageUrl = value;
        });
      });

      return right(imageUrl!);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
