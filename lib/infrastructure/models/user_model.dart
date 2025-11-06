import 'dart:typed_data';

import 'package:chattr_app/domain/entities/user.dart';

class UserModel {
  final int? id;
  final String? uuid;
  final String name;
  final String email;
  final String password;
  final Uint8List? userImg;
  final bool? isOnline;
  final DateTime? lastSeen;

  const UserModel({
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

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
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

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      uuid: user.uuid,
      name: user.name, 
      email: user.email, 
      password: user.password,
      userImg: user.userImg,
      isOnline: user.isOnline,
      lastSeen: user.lastSeen,
    );
  }

  User toEntity() => User(
    id: id,
    uuid: uuid,
    name: name, 
    email: email, 
    password: password,
    userImg: userImg,
    isOnline: isOnline,
    lastSeen: lastSeen,
  );
}