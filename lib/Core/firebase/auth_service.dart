import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model/user_model.dart';

class AuthService {
  Future<UserCredential> signUp({required UserModel userModel}) async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userModel.email!,
      password: userModel.password!,
    );
  }

  Future<UserCredential> signIn({required UserModel userModel}) async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: userModel.email!,
      password: userModel.password!,
    );
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
