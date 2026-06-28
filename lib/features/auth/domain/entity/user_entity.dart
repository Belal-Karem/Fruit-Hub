import 'dart:io';

class UserEntity {
  final String email;
  final String name;
  final String? uId;
  File? image;
  String? imageUrl;

  UserEntity({
    this.image,
    required this.email,
    required this.uId,
    required this.name,
  });
}
