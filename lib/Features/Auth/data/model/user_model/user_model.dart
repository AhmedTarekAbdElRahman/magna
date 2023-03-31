import 'package:magna/Core/utils/shared_preferences.dart';
class UserModel {
  String? uId;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? role;
  String? image;

  UserModel({
    this.uId,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.role,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId??CacheHelper.getData(key: 'uId'),
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'role': role,
      'image': image??'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=996&t=st=1680120982~exp=1680121582~hmac=373beb9727cd2384030f0ac9b5010ee0d3b7b2bc20b471a5bb2601a8e30ad99d',
    };
  }
}
