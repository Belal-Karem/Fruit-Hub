part of 'upload_image_cubit.dart';

sealed class UploadImageState extends Equatable {
  const UploadImageState();

  @override
  List<Object> get props => [];
}

final class UploadImageInitial extends UploadImageState {}

final class UploadImageSuccess extends UploadImageState {}

final class UploadImageFailure extends UploadImageState {
  final String message;
  const UploadImageFailure({required this.message});
}

final class UploadImageLoading extends UploadImageState {}
