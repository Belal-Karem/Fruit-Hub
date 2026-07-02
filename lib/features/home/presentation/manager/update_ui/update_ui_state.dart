part of 'update_ui_cubit.dart';

sealed class UpdateUiState extends Equatable {
  const UpdateUiState();

  @override
  List<Object> get props => [];
}

final class UpdateUiInitial extends UpdateUiState {}

final class UpdateUiSuccess extends UpdateUiState {}

final class UpdateUiFailer extends UpdateUiState {
  final String message;
  const UpdateUiFailer(this.message);
}

final class UpdateUiLoading extends UpdateUiState {}
