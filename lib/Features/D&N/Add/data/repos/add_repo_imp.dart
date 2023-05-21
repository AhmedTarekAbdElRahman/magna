import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:magna/Core/firebase/firestore_service.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../../Core/api_service/api_service.dart';
import '../../../../../Core/errors/failures.dart';
import '../../../../../Core/firebase/storage_service.dart';
import '../../../../../constant.dart';
import 'add_repo.dart';

class AddRepoImp implements AddRepo {
  final FireStoreService fireStorageService;
  final StorageService storageService;
  final ApiService apiService;

  AddRepoImp(this.fireStorageService, this.storageService, this.apiService);

  @override
  Future<Either<Failure, void>> addPatient(
      {required PatientModel patientModel}) async {
    try {
      var result = await fireStorageService.setDoc(
          uId: patientModel.id!,
          model: patientModel.toMap(),
          collectionReference: patients);
      await apiService.postData(data: {
        'to': '/topics/N',
        'notification': {
          "title": doctorName,
          "body": "Added ${patientModel.name}",
          "sound": "default"
        },
        'data': patientModel.notificationMap(),
      });
      patientGender = 'Male';
      //exerciseAnginaState = 'Yes';
      //chestPainType = 'Typical Angina';
      return right(result);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
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
