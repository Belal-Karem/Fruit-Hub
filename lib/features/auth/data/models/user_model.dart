import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.email, required super.uId, required super.name});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      email: user.email!,
      uId: user.uid,
      name: user.displayName ?? '',
    );
  }

  factory UserModel.formFireBase(Map<String, dynamic> map) {
    return UserModel(email: map[kEmail], uId: map[kUId], name: map[kName]);
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(email: kEmail, uId: kUId, name: kName);
  }
}
