import 'dart:typed_data';

class User {
  final int? id;
  final String? uuid;
  final String name;
  final String email;
  final String password;
  final Uint8List? userImg;
  final bool? isOnline;
  final DateTime? lastSeen;

  const User({
    this.id,
    this.uuid,
    required this.name,
    required this.email,
    required this.password,
    this.userImg,
    this.isOnline,
    this.lastSeen,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'email': email,
      'password': password,
      'userImg': userImg,
      'isOnline': isOnline,
      'lastSeen': lastSeen,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      uuid: json['uuid'],
      name: json['name'], 
      email: json['email'], 
      password: json['password'],
      userImg: json['userImg'],
      isOnline: json['isOnline'],
      lastSeen: json['lastSeen'],
    );
  }

  @override
  String toString() {
    return "id: $id, uuid: $uuid, name: $name, email: $email, password: $password, userImg: $userImg, isOnline: $isOnline, lastSeen: $lastSeen";
  }
}