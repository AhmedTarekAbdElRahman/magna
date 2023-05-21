import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:magna/Core/utils/functions/detect_chest_pain_type.dart';
import '../../../../../constant.dart';

class PatientModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? gender;
  String? description;
  String? image;
  String? age;
  bool? atHome;
  String? cholesterol;
  String?
      chestPainType; //normal0-typicalAngina1-atypicalAngina2-nonAnginaPain3-asymptomatic4
  String? fastingBloodSugar;
  String? exerciseAngina; //yes 1 no 0
  DateTime? createdAt;
  String? prediction;
  String? maxHeartRate;
  String? ecg;
  String? doctorId;
  String? doctorName;
  String? labResults;
  String? labNote;

  PatientModel({
    this.id,
    this.name,
    this.phone,
    this.gender,
    this.description,
    this.image,
    this.age,
    this.cholesterol,
    this.chestPainType, //normal0-typicalAngina1-atypicalAngina2-nonAnginaPain3-asymptomatic4
    this.fastingBloodSugar,
    this.exerciseAngina,
    this.createdAt,
    this.prediction,
    this.maxHeartRate,
    this.ecg,
    this.doctorId,
    this.email,
    this.password,
    this.doctorName,
    this.atHome,
    this.labResults,
    this.labNote
  });

  PatientModel.fromJson(DocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    email=json.data()!['email'];
    labResults=json.data()!['labResults'];
    labNote=json.data()!['labNote'];
    atHome=json.data()!['atHome'];
    name = json.data()!['name'];
    phone = json.data()!['phone'];
    gender = json.data()!['gender']== '1'?'Male':'Female';
    description = json.data()!['description'];
    image = json.data()!['image'];
    age = json.data()!['age'];
    cholesterol = json.data()!['cholesterol'];
    chestPainType = detectChestPainType(json.data()!['chestPainType']);
    fastingBloodSugar = json.data()!['fastingBloodSugar'];
    exerciseAngina = json.data()!['exerciseAngina']== '1'?'Yes':'No';
    //createdAt = json.data()!['createdAt'];
    prediction = json.data()!['prediction'] ;
    maxHeartRate = json.data()!['maxHeartRate'] ;
    ecg = json.data()!['ecg'] ;
    doctorId = json.data()!['doctorId'];
    doctorName = json.data()!['doctorName'];
  }
  PatientModel.fromNotification(Map<String, dynamic> json) {
    id = json['id'];
    email=json['email'];
    labResults=json['labResults'];
    labNote=json['labNote'];
    atHome= (json['atHome'])=='true'?true:false;
    name = json['name'];
    phone = json['phone'];
    gender = json['gender']== '1'?'Male':'Female';
    description = json['description'];
    image = json['image'];
    age = json['age'];
    cholesterol = json['cholesterol'];
    chestPainType = detectChestPainType(json['chestPainType']);
    fastingBloodSugar = json['fastingBloodSugar'];
    exerciseAngina = json['exerciseAngina']== '1'?'Yes':'No';
    //createdAt = json['createdAt'];
    prediction = json['prediction'] ;
    maxHeartRate = json['maxHeartRate'] ;
    ecg = json['ecg'] ;
    doctorId = json['doctorId'];
    doctorName = json['doctorName'];
  }

  Map<String, dynamic> notificationMap(){
    return {
      'id':id,
      //'atHome':atHome,
      'labResults':labResults,
      'name': name,
      'phone': phone,
      'email':email,
      'gender': gender== 'Male'?'1':'0',
      'description': description,
      'image': image ?? defaultImage,
      'age': age,
      'cholesterol': cholesterol,
      'chestPainType': detectChestPainType(chestPainType!),
      'fastingBloodSugar': fastingBloodSugar,
      'fastingBloodSugarML': int.parse(fastingBloodSugar!) >= 120 ? '1' : '0',
      'exerciseAngina': exerciseAngina == 'Yes' ? '1' : '0',
      'prediction': prediction ,
      'maxHeartRate': maxHeartRate,
      'ecg': ecg ,
      'doctorId': uId,
      'doctorName': doctorName,
      'labNote': labNote,
    };
  }
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'phone': phone,
      'labResults':labResults,
      'labNote': labNote,
      'email':email,
      'gender': gender== 'Male'?'1':'0',
      'description': description,
      'image': image ?? defaultImage,
      'age': age,
      'cholesterol': cholesterol,
      'chestPainType': detectChestPainType(chestPainType!),
      'fastingBloodSugar': fastingBloodSugar,
      'fastingBloodSugarML': int.parse(fastingBloodSugar!) >= 120 ? '1' : '0',
      'exerciseAngina': exerciseAngina == 'Yes' ? '1' : '0',
      'prediction': prediction ,
      'maxHeartRate': maxHeartRate ,
      'ecg': ecg,
      'doctorId': uId,
      'doctorName': doctorName,
      'atHome':false,
      'createdAt': DateTime.now(),
    };
  }

  Map<String, dynamic> editMap() {
    return {
      'name': name,
      'phone': phone,
      'atHome':atHome,
      'description': description,
      'image': image ?? defaultImage,
      'age': age,
      'labResults':labResults,
      'labNote': labNote,
      'cholesterol': cholesterol,
      'chestPainType': detectChestPainType(chestPainType!),
      'fastingBloodSugar': fastingBloodSugar,
      'fastingBloodSugarML': int.parse(fastingBloodSugar!) >= 120 ? '1' : '0',
      'exerciseAngina': exerciseAngina == 'Yes' ? '1' : '0',
    };
  }
}
