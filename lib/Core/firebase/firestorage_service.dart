import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/user_model/user_model.dart';

class FireStorageService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUser({required UserModel userModel}) async {
    print(userModel.uId);
    return await users.doc(userModel.uId).set(userModel.toMap());
  }

  Future<DocumentSnapshot> getUser({required String uId}) async {
    return await users.doc(uId).get();
  }
  Future<void> editUser({required UserModel userModel}) async {
    return await users.doc(userModel.uId).update(userModel.editMap());
  }
  // Stream<DocumentSnapshot> getUser() async* {
  //   yield*  users.doc(uId).snapshots(includeMetadataChanges: true);
  // }

}
