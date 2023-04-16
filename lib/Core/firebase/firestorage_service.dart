import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magna/Core/model/patient_model/patient_model.dart';
import '../model/user_model/user_model.dart';

class FireStorageService {
  // Users
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser({required UserModel userModel}) async {
    return await users.doc(userModel.uId).set(userModel.toMap());
  }

  Future<DocumentSnapshot> getUser({required String uId}) async {
    return await users.doc(uId).get();
  }
  Future<void> editUser({required UserModel userModel}) async {
    return await users.doc(userModel.uId).update(userModel.editMap());
  }

  //Patients
  final CollectionReference patients =
  FirebaseFirestore.instance.collection('patients');
  Future<DocumentReference> addPatient({required PatientModel patientModel}) async {
    return await patients.add(patientModel.toMap());
  }
  Future<void> deletePatient({required String patientId}) async {
    return await patients.doc(patientId).delete();
  }
  Future<void> editPatient({required PatientModel patientModel}) async {
    return await patients.doc(patientModel.id).update(patientModel.editMap());
  }
  Stream<QuerySnapshot<Object?>> getPatients()async*{
    yield* patients.snapshots();
  }
  // Stream<QuerySnapshot<Object?>> search(String searchKey)async*{
  //   yield* patients.where("name",arrayContains:searchKey).snapshots();
  // }
  // Stream<DocumentSnapshot> getUser() async* {
  //   yield*  users.doc(uId).snapshots(includeMetadataChanges: true);
  // }

}
