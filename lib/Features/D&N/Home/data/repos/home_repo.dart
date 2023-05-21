import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../../../../../Core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, void>>deletePatient({required String patientId});
  Future<Either<Failure, void>>deletePatientRole({required String patientId});
  Future<Either<Failure, void>>editPatient({required PatientModel patientModel});
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>>getDoctorPatients();
  Future<Either<Failure, Stream<QuerySnapshot<Object?>>>>getNursePatients();
  Future<Either<Failure, String>> uploadImage({required File patientImage});

}
