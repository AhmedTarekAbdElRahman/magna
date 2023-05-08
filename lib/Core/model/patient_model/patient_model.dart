import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../constant.dart';

class PatientModel {
  String? id;
  String? name;
  String? phone;
  String? gender;
  String? description;
  String? image;
  String? age;
  String? cholesterol;
  String?
      chestPainType; //normal0-typicalAngina1-atypicalAngina2-nonAnginaPain3-asymptomatic4
  String? fastingBloodSugar;
  String? fastingBloodSugarML; //>120 1 else 0
  String? exerciseAngina; //yes 1 no 0
  DateTime? createdAt;
  String? prediction;
  String? maxHeartRate;
  String? ecg;
  String? doctorId;
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
    this.fastingBloodSugarML,
    this.exerciseAngina,
    this.createdAt,
    this.prediction,
    this.maxHeartRate,
    this.ecg,
    this.doctorId,
  });

  PatientModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    name = json.data()['name'];
    phone = json.data()['phone'];
    gender = json.data()['gender'];
    description = json.data()['description'];
    image = json.data()['image'];
    age = json.data()['age'];
    cholesterol = json.data()['cholesterol'];
    chestPainType = json.data()['chestPainType'];
    fastingBloodSugar = json.data()['fastingBloodSugar'];
    exerciseAngina = json.data()['exerciseAngina'];
    //createdAt = json.data()['createdAt'];
    prediction = json.data()['prediction']??'';
    maxHeartRate = json.data()['maxHeartRate']??'';
    ecg = json.data()['ecg']??'';
    doctorId = json.data()['doctorId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'gender': gender,
      'description': description,
      'image': image ?? defaultImage,
      'age': age,
      'cholesterol': cholesterol,
      'chestPainType': chestPainType,
      'fastingBloodSugar': fastingBloodSugar,
      'fastingBloodSugarML': fastingBloodSugarML,
      'exerciseAngina': exerciseAngina,
      'prediction': prediction??'',
      'maxHeartRate': maxHeartRate??'',
      'ecg': ecg??'',
      'doctorId': uId,
      'createdAt': DateTime.now(),
    };
  }

  Map<String, dynamic> editMap() {
    return {
      'name': name,
      'phone': phone,
      'description': description,
      'image': image ?? defaultImage,
      'age': age,
      'cholesterol': cholesterol,
      'chestPainType': chestPainType,
      'fastingBloodSugar': fastingBloodSugar,
      'exerciseAngina': exerciseAngina,
      'prediction': prediction,
      'maxHeartRate': maxHeartRate,
      'ecg': ecg,
    };
  }
}
