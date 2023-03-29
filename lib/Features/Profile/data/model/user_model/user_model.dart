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
      'uId': uId,
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'role': role,
      'image': image,
    };
  }
}
