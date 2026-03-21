import 'package:bloc/bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/user_entity.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(user: userEntity)),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (userEntity) => emit(LoginSuccess(user: userEntity)),
    );
  }
}
