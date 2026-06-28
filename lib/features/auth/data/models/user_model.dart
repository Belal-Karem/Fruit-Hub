import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  String? imageUrl;
  UserModel({
    this.imageUrl,
    required super.email,
    required super.uId,
    required super.name,
  });

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email!,
      uId: user.uid,
      name: user.displayName ?? '',
      imageUrl: user.photoURL,
    );
  }

  factory UserModel.formFireBase(Map<String, dynamic> map) {
    return UserModel(
      email: map[kEmail],
      uId: map[kUId],
      name: map[kName],
      imageUrl: map['imageUrl'],
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map[kEmail],
      uId: map[kUId],
      name: map[kName],
      imageUrl: map['imageUrl'],
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      email: user.email,
      uId: user.uId,
      name: user.name,
      imageUrl: user.imageUrl,
    );
  }

  toMap() {
    return {'email': email, 'name': name, 'uId': uId, 'imageUrl': imageUrl};
  }
}
