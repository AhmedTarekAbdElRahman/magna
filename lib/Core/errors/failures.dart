import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure{
  final String errMessage;
  const Failure(this.errMessage);
}
class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromFirebase(FirebaseAuthException exception) {
    switch(exception.code){
      case 'user-not-found':
        return ServerFailure('No user found for that email.');
      case 'wrong-password':
        return ServerFailure('Wrong password provided for that user.');
      case "account-exists-with-different-credential":
      case 'email-already-in-use':
        return ServerFailure('The account already exists for that email.');
      case 'user-disabled':
        return ServerFailure('User disabled.');
      case "operation-not-allowed":
        return ServerFailure('Too many requests to log into this account.');
      case 'invalid-email':
        return ServerFailure('Email address is invalid.');
      case 'weak-password':
        return ServerFailure('The password provided is too weak.');
      case 'network-request-failed':
        return ServerFailure('Check your network, please!.');
      case 'timeout':
        return ServerFailure('timeout try again, Please!.');
      default:
        return ServerFailure('Something is wrong. Please try again.');
    }
  }
}