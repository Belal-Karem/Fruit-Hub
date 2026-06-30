import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/repo/ubdate_user_data/ubdate_user_data_repo_impl.dart';
import '../../../../auth/domain/entity/user_entity.dart';

part 'update_user_data_cubit_state.dart';

class UpdateUserDataCubitCubit extends Cubit<UpdateUserDataCubitState> {
  final UpdateUserDataRepoImpl ubdateUserDataRepoImpl;
  UpdateUserDataCubitCubit(this.ubdateUserDataRepoImpl)
    : super(UpdateUserDataCubitInitial());

  Future<void> ubdateUserData({
    required UserEntity user,
    required String uId,
  }) async {
    emit(UpdateUserDataCubitLoading());
    final result = await ubdateUserDataRepoImpl.ubdateUserData(
      user: user,
      uId: uId,
    );
    result.fold(
      (failure) => emit(UpdateUserDataCubitFailure(message: failure.message)),
      (r) => emit(UpdateUserDataCubitSuccess()),
    );
  }

  Future<void> updateEmail({
    required String currentPassword,
    required String email,
  }) async {
    emit(UpdateUserDataCubitLoading());
    final result = await ubdateUserDataRepoImpl.updateEmail(
      currentPassword: currentPassword,
      email: email,
    );
    result.fold(
      (failure) => emit(UpdateUserDataCubitFailure(message: failure.message)),
      (r) => emit(UpdateUserDataCubitSuccess()),
    );
  }

  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    emit(UpdateUserDataCubitLoading());
    final result = await ubdateUserDataRepoImpl.updatePassword(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(UpdateUserDataCubitFailure(message: failure.message)),
      (r) => emit(UpdateUserDataCubitSuccess()),
    );
  }
}
