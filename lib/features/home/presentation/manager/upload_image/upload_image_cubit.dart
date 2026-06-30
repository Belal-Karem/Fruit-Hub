import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/helper_functions/get_user.dart';
import 'package:fruit_hub/core/repo/ubdate_user_data/ubdate_user_date_repo.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hub/features/home/domain/entites/repo/upload_image_repo.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageRepo uploadImageRepo;
  final UbdateUserDataRepo ubdateUserDataRepo;
  UploadImageCubit(this.uploadImageRepo, this.ubdateUserDataRepo)
    : super(UploadImageInitial());

  Future<void> uploadImage(File image) async {
    emit(UploadImageLoading());
    var result = await uploadImageRepo.uploadImage(image);
    result.fold(
      (failure) => emit(UploadImageFailure(message: failure.message)),
      (url) async {
        var getUser = getUserData();
        var result = await ubdateUserDataRepo.ubdateUserData(
          user: UserEntity(
            email: getUser.email,
            uId: getUser.uId,
            name: getUser.name,
            image: image,
            imageUrl: url,
          ),
        );
        result.fold(
          (failure) => emit(UploadImageFailure(message: failure.message)),
          (_) => emit(UploadImageSuccess()),
        );
      },
    );
  }
}
