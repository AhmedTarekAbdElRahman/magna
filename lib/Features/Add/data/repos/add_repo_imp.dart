import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../Core/errors/failures.dart';
import '../../../../Core/firebase/storage_service.dart';
import '../../../../constant.dart';
import 'add_repo.dart';

class AddRepoImp implements AddRepo {
  final FireStoreService fireStorageService;
final StorageService storageService;
  AddRepoImp(this.fireStorageService, this.storageService);

  @override
  Future<Either<Failure, DocumentReference>> addPatient(
      {required PatientModel patientModel}) async {
    try {
      var result =
          await fireStorageService.addDoc(model: patientModel.toMap(), collectionReference: patients);
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
  String? imageUrl;
  @override
  Future<Either<Failure, String>> uploadImage(
      {required File patientImage}) async {
    try {
      await storageService.uploadImage(image: patientImage).then((value)async{
        await value.ref.getDownloadURL().then((value){
          imageUrl=value;
        });
      });

      return right(imageUrl!);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
