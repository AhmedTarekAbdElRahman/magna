import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService{
  FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;
  subscribe({required String topic})async{
    await firebaseMessaging.subscribeToTopic(topic);
  }
  unsubscribe({required String topic})async{
    await firebaseMessaging.unsubscribeFromTopic(topic);
  }
}