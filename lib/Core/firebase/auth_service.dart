import 'package:firebase_auth/firebase_auth.dart';

import '../model/user_model/user_model.dart';

class AuthService {
  final user = FirebaseAuth.instance;

  Future<UserCredential> signUp({required UserModel userModel}) async {
    return await user.createUserWithEmailAndPassword(
      email: userModel.email!,
      password: userModel.password!,
    );
  }

  Future<UserCredential> signIn({required UserModel userModel}) async {
    return await user.signInWithEmailAndPassword(
      email: userModel.email!,
      password: userModel.password!,
    );
  }

  Future<void> signOut() async {
    await user.signOut();
  }

  Future<void> changePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
  }) async {
    await user.signInWithEmailAndPassword(
      email: email,
      password: oldPassword,
    ).then((value)async{
      await value.user!.updatePassword(newPassword);
    });
  }
}
