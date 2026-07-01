import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/repo/ubdate_user_data/ubdate_user_date_repo.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../auth/domain/entity/user_entity.dart';

part 'update_user_data_cubit_state.dart';

class UpdateUserDataCubit extends Cubit<UpdateUserDataCubitState> {
  final UpdateUserDataRepo updateUserDataRepo;
  UpdateUserDataCubit(this.updateUserDataRepo)
    : super(UpdateUserDataCubitInitial());

  Future<void> updateUserData({
    String? name,
    String? email,
    String? currentPassword,
  }) async {
    emit(UpdateUserDataCubitLoading());

    if (email != null && email != getUserData().email) {
      final emailResult = await updateUserDataRepo.updateEmail(
        currentPassword: currentPassword!,
        email: email,
      );

      final isFailure = emailResult.fold((failure) {
        emit(UpdateUserDataCubitFailure(message: failure.message));
        return true;
      }, (_) => false);

      if (isFailure) return;
    }

    final result = await updateUserDataRepo.updateUserData(
      user: UserEntity(
        uId: getUserData().uId,
        name: name ?? getUserData().name,
        email: email ?? getUserData().email,
        imageUrl: getUserData().imageUrl,
      ),
    );

    result.fold(
      (failure) => emit(UpdateUserDataCubitFailure(message: failure.message)),
      (_) => emit(UpdateUserDataCubitSuccess()),
    );
  }

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(UpdateUserDataCubitLoading());
    final result = await updateUserDataRepo.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(UpdateUserDataCubitFailure(message: failure.message)),
      (r) => emit(UpdateUserDataCubitSuccess()),
    );
  }
}
