import 'package:fruit_hub/core/repo/order_repo/order_repo.dart';
import 'package:fruit_hub/core/repo/order_repo/order_repo_impl.dart';
import 'package:fruit_hub/core/repo/prodcts_repo/products_repo.dart';
import 'package:fruit_hub/core/repo/prodcts_repo/products_repo_impl.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/firestore_service.dart';
import 'package:fruit_hub/core/services/storage_service.dart';
import 'package:fruit_hub/core/services/supabase_storage_service.dart';
import 'package:fruit_hub/features/auth/data/repos/auth_repo_imle.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/home/data/repo/upload_image_repo_impl.dart';
import 'package:fruit_hub/features/home/domain/entites/repo/upload_image_repo.dart';
import 'package:get_it/get_it.dart';

import 'data_base_service.dart';

final getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreService());
  getIt.registerSingleton<StorageService>(SupabaseStorageService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImle(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      dataBaseService: getIt<DataBaseService>(),
    ),
  );

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(dataBaseService: getIt<DataBaseService>()),
  );

  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(dataBaseService: getIt<DataBaseService>()),
  );
  getIt.registerSingleton<UploadImageRepo>(
    UploadImageRepoImpl(storageService: getIt<StorageService>()),
  );
}
