import 'package:dio/dio.dart';
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
  factory ServerFailure.fromDioError(DioError dioError) {
    switch(dioError.type){
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer is cancelled');
      case DioErrorType.unknown:
        if(dioError.message!.contains('SocketException')){
          return ServerFailure('Np internet connection');
        }
        return ServerFailure('Unexpected Error, Please try again');
      default:
        return ServerFailure('Ops there was an Error, Please try again');
    }
  }
  factory ServerFailure.fromResponse(int? statusCode, dynamic response){
    if(statusCode==400 || statusCode==401 || statusCode==403 ){
      return ServerFailure(response['error']['message']);
    }else if(statusCode==404){
      return ServerFailure('Your request not found, Please try later!');
    }else if(statusCode==500){
      return ServerFailure('Internal server error, Please try later!');
    }else{
      return ServerFailure('Ops there was an Error, Please try again');
    }
  }
}