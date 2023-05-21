import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'package:magna/Features/Patient/data/repos/patient_repo.dart';
import 'package:magna/constant.dart';

import '../../../../Core/api_service/api_service.dart';
import '../../../../Core/firebase/firestore_service.dart';
import '../../../../Core/firebase/storage_service.dart';

class PatientRepoImp implements PatientRepo {
  final FireStoreService fireStorageService;
  final StorageService storageService;
  final ApiService apiService;

  PatientRepoImp(this.fireStorageService, this.storageService, this.apiService);

  @override
  Future<Either<Failure, Stream<DocumentSnapshot>>> getPatientProfile(
      {required String pId}) async {
    try {
      final result = fireStorageService.getDocSnapshot(
          uId: pId, collectionReference: patients);
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  String? imageUrl;

  @override
  Future<Either<Failure, String>> uploadLabResultStorage(
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

  @override
  Future<Either<Failure, void>> uploadLabResultFirestore(
      {required PatientModel patientModel}) async {
    try {
      final result=await fireStorageService.editDoc(
        id: patientModel.id!,
        model: {'labResults': patientModel.labResults},
        collectionReference: patients,
      );
      print(patientModel.doctorName);
      await apiService.postData(data: {
        'to': '/topics/${patientModel.doctorId}',
        'notification': {
          "title": patientModel.name,
          "body": "Uploaded his lab results",
          "sound": "default"
        },
        'data':patientModel.notificationMap()
      });
      return right(result);
    } catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
