import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../Core/firebase/storage_service.dart';
import '../../../../constant.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final FireStoreService fireStorageService;
  final StorageService storageService;

  HomeRepoImp(this.fireStorageService, this.storageService);

  @override
  Future<Either<Failure, void>> deletePatient(
      {required String patientId}) async {
    try {
      final result = await fireStorageService.deleteDoc(
          collectionReference: patients, patientId: patientId);
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editPatient(
      {required PatientModel patientModel}) async {
    try {
      final result = await fireStorageService.editDoc(
          id: patientModel.id!,collectionReference: patients, model: patientModel.editMap());
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>> getDoctorPatients() async {
    try {
      final result = fireStorageService.getCollectionWithQuery();
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>> getNursePatients() async {
    try {
      final result = fireStorageService.getCollection();
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  String? imageUrl;

  @override
  Future<Either<Failure, String>> uploadImage(
      {required File patientImage}) async {
    try {
      await storageService.uploadImage(image: patientImage).then((value) async {
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
