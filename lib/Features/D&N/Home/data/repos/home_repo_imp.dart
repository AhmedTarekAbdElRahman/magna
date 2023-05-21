import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../../Core/api_service/api_service.dart';
import '../../../../../Core/firebase/storage_service.dart';
import '../../../../../constant.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final FireStoreService fireStorageService;
  final StorageService storageService;
  final ApiService apiService;

  HomeRepoImp(this.fireStorageService, this.storageService, this.apiService);

  @override
  Future<Either<Failure, void>> deletePatient(
      {required String patientId}) async {
    try {
      final result = await fireStorageService.deleteDoc(
          collectionReference: patients, patientId: patientId);
      deletePatientRole(patientId: patientId);
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePatientRole(
      {required String patientId}) async {
    try {
      final result = await fireStorageService.deleteDoc(
          collectionReference: roles, patientId: patientId);
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
          id: patientModel.id!,
          collectionReference: patients,
          model: patientModel.editMap());

      if (role == 'P') {
        await apiService.postData(data: {
          'to': '/topics/${patientModel.doctorId}',
          'notification': {
            "title": patientModel.name,
            "body": "Edited his details",
            "sound": "default"
          },
          'data': patientModel.notificationMap(),
        });
      } else if (role == 'D') {
        await apiService.postData(data: {
          'to': '/topics/${patientModel.id}',
          'notification': {
            "title": doctorName,
            "body": "Edited your details",
            "sound": "default"
          },
        });
        if (patientModel.atHome! == false) {
          await apiService.postData(data: {
            'to': '/topics/N',
            'notification': {
              "title": doctorName,
              "body": "Edited ${patientModel.name} details",
              "sound": "default"
            },
            'data': patientModel.notificationMap(),
          });
        }
      }
      //exerciseAnginaState = 'Yes';
      //chestPainType = 'Typical Angina';
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>>
      getDoctorPatients() async {
    try {
      final result = fireStorageService.getCollectionWithQuery();
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>>
      getNursePatients() async {
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
