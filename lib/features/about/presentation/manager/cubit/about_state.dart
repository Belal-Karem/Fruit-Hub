part of 'about_cubit.dart';

sealed class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object> get props => [];
}

final class AboutInitial extends AboutState {}

final class AboutLoading extends AboutState {}

final class AboutSuccess extends AboutState {
  final AboutEntity about;
  const AboutSuccess(this.about);
}

final class AboutFailure extends AboutState {
  final String message;
  const AboutFailure(this.message);
}
