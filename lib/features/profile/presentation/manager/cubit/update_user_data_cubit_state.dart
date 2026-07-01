part of 'update_user_data_cubit.dart';

sealed class UpdateUserDataCubitState extends Equatable {
  const UpdateUserDataCubitState();

  @override
  List<Object> get props => [];
}

final class UpdateUserDataCubitInitial extends UpdateUserDataCubitState {}

final class UpdateUserDataCubitLoading extends UpdateUserDataCubitState {}

final class UpdateUserDataCubitSuccess extends UpdateUserDataCubitState {}

final class UpdateUserDataCubitFailure extends UpdateUserDataCubitState {
  final String message;
  const UpdateUserDataCubitFailure({required this.message});
}
