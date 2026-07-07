import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/exception.dart';
import 'package:fruit_hub/core/error/failures.dart';
import 'package:fruit_hub/core/services/data_base_service.dart';
import 'package:fruit_hub/features/about/domain/entites/about_entity.dart';
import 'package:fruit_hub/features/about/domain/repo/about_repo.dart';

import '../../../../core/utils/backend_endpoint.dart';
import '../models/about_model.dart';

class AboutRepoImpl implements AboutRepo {
  final DataBaseService dataBaseService;

  AboutRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, AboutEntity>> getAbout() async {
    try {
      var data = await dataBaseService.getData(path: BackendEndpoint.getAbout);
      return right(AboutModel.fromJson(data).toEntity());
    } on CustomException catch (e) {
      log('Exception in AboutRepoImpl.getAbout ${e.toString()}');
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AboutRepoImpl.getAbout ${e.toString()}');
      return left(ServerFailure('حدث خطاء غير متوقع'));
    }
  }
}
