import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/errors/failures.dart';
import 'package:magna/Core/firebase/firestorage_service.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import 'home_repo.dart';

class HomeRepoImp implements HomeRepo {
  final FireStorageService fireStorageService;

  HomeRepoImp(this.fireStorageService);

  @override
  Future<Either<Failure, void>> deletePatient(
      {required String patientId}) async {
    try {
      final result =
          await fireStorageService.deletePatient(patientId: patientId);
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> editPatient(
      {required PatientModel patientModel}) async {
    try {
      final result =
          await fireStorageService.editPatient(patientModel: patientModel);
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>> getPatients() async {
    try {
     final result= fireStorageService.getPatients();
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
