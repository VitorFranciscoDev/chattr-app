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
}