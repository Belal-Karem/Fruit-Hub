import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProduct();
    result.fold(
      (failure) => emit(ProductsFailure(message: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
