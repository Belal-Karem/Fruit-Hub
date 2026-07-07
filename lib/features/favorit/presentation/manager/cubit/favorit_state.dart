part of 'favorit_cubit.dart';

sealed class FavoritState extends Equatable {
  const FavoritState();

  @override
  List<Object> get props => [];
}

final class FavoritInitial extends FavoritState {}

class FavoritLoading extends FavoritState {}

class AddFavoritSuccess extends FavoritState {}

class GetFavoritSuccess extends FavoritState {
  final List<FavoritEntity> favoritEntity;
  const GetFavoritSuccess(this.favoritEntity);
}

class FavoritFailure extends FavoritState {
  final String message;
  const FavoritFailure(this.message);
}
