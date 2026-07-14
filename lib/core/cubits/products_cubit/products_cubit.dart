import 'package:bloc/bloc.dart';
import 'package:fruit_hub/core/entites/product_entity.dart';
import 'package:fruit_hub/core/repo/prodcts_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  int productslength = 0;
  List<ProductEntity> productsList = [];

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold((failure) => emit(ProductsFailure(message: failure.message)), (
      products,
    ) {
      productslength = products.length;
      productsList = products;
      emit(ProductsSuccess(products: products));
    });
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProduct();
    result.fold((failure) => emit(ProductsFailure(message: failure.message)), (
      products,
    ) {
      productsList = products;
      emit(ProductsSuccess(products: products));
    });
  }

  Future<void> filterProducts({required String value}) async {
    if (value.trim().isEmpty) {
      emit(ProductsSuccess(products: productsList));
      return;
    }

    final filteredProducts = productsList.where((product) {
      return product.name.toLowerCase().startsWith(value.trim().toLowerCase());
    }).toList();

    emit(ProductsSuccess(products: filteredProducts));
  }
}
