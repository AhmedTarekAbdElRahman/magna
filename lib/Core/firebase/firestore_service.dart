import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constant.dart';

class FireStoreService {
  Future<void> setDoc(
      {required Map<String, dynamic> model,
      required CollectionReference collectionReference,required String uId}) async {
    return await collectionReference.doc(uId).set(model);
  }

  Future<DocumentSnapshot> getDoc(
      {required String uId,
      required CollectionReference collectionReference}) async {
    return await collectionReference.doc(uId).get();
  }

  Future<DocumentReference> addDoc(
      {required Map<String, dynamic> model,
      required CollectionReference collectionReference}) async {
    return await collectionReference.add(model);
  }

  Future<void> deleteDoc(
      {required String patientId,
      required CollectionReference collectionReference}) async {
    return await collectionReference.doc(patientId).delete();
  }

  Future<void> editDoc(
      {required String id, required Map<String, dynamic> model,
      required CollectionReference collectionReference}) async {
    return await collectionReference.doc(id).update(model);
  }
  Stream<DocumentSnapshot> getDocSnapshot(
      {required String uId,
        required CollectionReference collectionReference}) async* {
   yield* collectionReference.doc(uId).snapshots();
  }
  Stream<QuerySnapshot<Object?>> getCollectionWithQuery() async* {
    yield* patients
        .where('doctorId', isEqualTo: uId)
        .orderBy(descending: true, 'createdAt')
        .snapshots();
  }

  Stream<QuerySnapshot<Object?>> getCollection() async* {
    yield* patients.where('atHome', isEqualTo: false).orderBy(descending: true, 'createdAt').snapshots();
  }
}
