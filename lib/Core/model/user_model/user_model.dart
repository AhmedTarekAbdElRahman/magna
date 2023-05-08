import '../../../../../constant.dart';

class UserModel {
  String? uId;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? role;
  String? image;
  DateTime? createdAt;

  UserModel({
    this.uId,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.role,
    this.image,
    this.createdAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    role = json['role'];
    image = json['image'];
    //createdAt = json['createdAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'phone': phone,
      'email': email,
      'role': role,
      'image': image ?? defaultImage,
      'createdAt': DateTime.now(),
    };
  }

  Map<String, dynamic> editMap() {
    return {
      'name': name,
      'phone': phone,
      'image': image ?? defaultImage,
    };
  }
}
