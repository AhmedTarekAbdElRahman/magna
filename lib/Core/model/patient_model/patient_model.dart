import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../constant.dart';
class PatientModel {
  String? id;
  String? name;
  String? phone;
  String? gender;
  String? description;
  String? image;

  PatientModel({
    this.id,
    this.name,
    this.phone,
    this.gender,
    this.description,
    this.image,
  });

  PatientModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    id = json.id;
    name = json.data()['name'];
    phone = json.data()['phone'];
    gender = json.data()['gender'];
    description = json.data()['description'];
    image = json.data()['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name':name,
      'phone': phone,
      'gender': gender,
      'description': description,
      'image': image ?? defaultImage,
    };
  }
  Map<String, dynamic> editMap() {
    return {
      'name':name,
      'phone': phone,
      'description': description,
      'image': image ?? defaultImage,
    };
  }

}

