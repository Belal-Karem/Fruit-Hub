import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/features/auth/domain/entity/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/home/domain/entites/repo/upload_image_repo.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  final UploadImageRepo uploadImageRepo;
  final AuthRepo authRepo;
  UploadImageCubit(this.uploadImageRepo, this.authRepo)
    : super(UploadImageInitial());

  Future<void> uploadImage(UserEntity user) async {
    emit(UploadImageLoading());
    var result = await uploadImageRepo.uploadImage(user.image!);
    result.fold(
      (failure) => emit(UploadImageFailure(message: failure.message)),
      (url) async {
        user.imageUrl = url;
        var result = await authRepo.saveUserData(user: user);
        result.fold(
          (failure) => emit(UploadImageFailure(message: failure.message)),
          (_) => emit(UploadImageSuccess()),
        );
      },
    );
  }
}
