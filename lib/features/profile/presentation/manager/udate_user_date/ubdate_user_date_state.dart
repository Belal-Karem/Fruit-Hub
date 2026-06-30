part of 'ubdate_user_date_cubit.dart';

sealed class UbdateUserDateState extends Equatable {
  const UbdateUserDateState();

  @override
  List<Object> get props => [];
}

final class UbdateUserDateInitial extends UbdateUserDateState {}

final class UbdateUserDateLoading extends UbdateUserDateState {}

final class UbdateUserDateSuccess extends UbdateUserDateState {}

final class UbdateUserDateFailure extends UbdateUserDateState {
  final String message;
  const UbdateUserDateFailure({required this.message});
}
