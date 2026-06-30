import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/repo/ubdate_user_data/ubdate_user_date_repo.dart';

import '../../../../../core/helper_functions/get_user.dart';
import '../../../../auth/domain/entity/user_entity.dart';

part 'ubdate_user_date_state.dart';

class UbdateUserDateCubit extends Cubit<UbdateUserDateState> {
  final UbdateUserDataRepo ubdateUserDataRepo;
  UbdateUserDateCubit(this.ubdateUserDataRepo) : super(UbdateUserDateInitial());

  Future<void> ubdateUserData({
    required String name,
    required String email,
  }) async {
    emit(UbdateUserDateLoading());
    var result = await ubdateUserDataRepo.ubdateUserData(
      user: UserEntity(name: name, email: email, uId: getUserData().uId),
    );
    result.fold(
      (failure) => emit(UbdateUserDateFailure(message: failure.message)),
      (_) => emit(UbdateUserDateSuccess()),
    );
  }
}
