import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_ui_state.dart';

class UpdateUiCubit extends Cubit<UpdateUiState> {
  UpdateUiCubit() : super(UpdateUiInitial());

  void updateUi() {
    emit(UpdateUiLoading());
    emit(UpdateUiSuccess());
  }
}
