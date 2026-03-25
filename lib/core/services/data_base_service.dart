// such as the repo
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';

abstract class DataBaseService {
  Future<void> addDtata({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<UserEntity> getData({required String path, required String uId});
}
