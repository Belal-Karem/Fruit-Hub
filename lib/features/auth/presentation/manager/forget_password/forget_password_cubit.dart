import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo authRepo;
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());

  Future<void> forgotPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    final result = await authRepo.forgotPassword(email: email);
    result.fold(
      (failure) => emit(ForgetPasswordFailure(message: failure.message)),
      (_) => emit(ForgetPasswordSuccess()),
    );
  }
}
