import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/firebase/firestorage_service.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../Core/errors/failures.dart';
import 'add_repo.dart';

class AddRepoImp implements AddRepo {
  final FireStorageService fireStorageService;

  AddRepoImp(this.fireStorageService);

  @override
  Future<Either<Failure, DocumentReference>> addPatient(
      {required PatientModel patientModel}) async {
    try {
      var result =
          await fireStorageService.addPatient(patientModel: patientModel);
      return right(result);
    } catch (e) {
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
