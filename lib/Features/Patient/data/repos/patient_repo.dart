import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../Core/errors/failures.dart';

abstract class PatientRepo {
  Future<Either<Failure, Stream<DocumentSnapshot>>> getPatientProfile({required String pId});
  Future<Either<Failure, String>> uploadLabResultStorage({required File patientImage});
  Future<Either<Failure, void>> uploadLabResultFirestore({required PatientModel patientModel});

}
