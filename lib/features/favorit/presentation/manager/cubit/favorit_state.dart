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
  final List<ProductEntity> productEntities;
  const GetFavoritSuccess(this.productEntities);
}

class FavoritFailure extends FavoritState {
  final String message;
  const FavoritFailure(this.message);
}
