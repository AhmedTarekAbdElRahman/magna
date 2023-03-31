import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magna/Features/Auth/data/model/user_model/user_model.dart';

import '../../constant.dart';

class FireStorageService{
  //FireStorageService({required this.users});
  final CollectionReference users=FirebaseFirestore.instance.collection('users') ;
  Future<void> addUser({required UserModel userModel}) {
    print(userModel.uId);
    return users.doc(userModel.uId).set(
       userModel.toMap()
    );
  }

}