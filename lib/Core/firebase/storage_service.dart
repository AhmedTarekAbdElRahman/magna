import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class StorageService {

  Future<firebase_storage.TaskSnapshot> uploadImage({required File image}) async  {

    return await firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(image.path).pathSegments.last}')
        .putFile(image);
  }
}
