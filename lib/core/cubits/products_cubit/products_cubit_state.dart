part of 'products_cubit.dart';

@immutable
sealed class ProductsCubitState {}

final class ProductsCubitInitial extends ProductsCubitState {}

final class ProductsCubitLoading extends ProductsCubitState {}

final class ProductsCubitSuccess extends ProductsCubitState {
  final List<ProductEntity> products;
  ProductsCubitSuccess({required this.products});
}

final class ProductsCubitFailure extends ProductsCubitState {
  final String message;
  ProductsCubitFailure({required this.message});
}
