import 'dart:convert';

import 'package:fruit_hub/core/services/shared_preferences%20_singleton.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';

UserEntity getUserData() {
  var jsonString = Prefs.getString(BackendEndpoint.kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
