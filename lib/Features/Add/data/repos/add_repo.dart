import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../Core/errors/failures.dart';
import '../../../../Core/model/patient_model/patient_model.dart';

abstract class AddRepo {
  Future<Either<Failure, DocumentReference>> addPatient({
    required PatientModel patientModel,
  });
  Future<Either<Failure, String>> uploadImage({required File patientImage});

}
