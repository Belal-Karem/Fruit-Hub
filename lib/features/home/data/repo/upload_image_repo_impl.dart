import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/features/home/domain/entites/repo/upload_image_repo.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/services/storage_service.dart';
import '../../../../core/utils/backend_endpoint.dart';

class UploadImageRepoImpl implements UploadImageRepo {
  final StorageService storageService;

  UploadImageRepoImpl({required this.storageService});

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      var imageUrl = await storageService.uploadFile(
        file: image,
        path: BackendEndpoint.image,
      );
      return Right(imageUrl);
    } on CustomException catch (e) {
      log('Error uploading image: $e');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Error uploading image: $e');
      return left(ServerFailure(e.toString()));
    }
  }
}
